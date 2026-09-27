{-# LANGUAGE ExistentialQuantification #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE OverloadedStrings #-}

-- | Register Haskell functions as native Janet functions ('registerFunction',
-- 'registerFunctions'), so Janet code can call back into Haskell — of any
-- fixed arity (via 'JanetFunction'), or variadic (via 'Variadic'\/'variadic').
module Janet.Register
    ( JanetFunction
    , Variadic (..)
    , variadic
    , SomeJanetFunction (..)
    , registerFunction
    , registerFunctions
    ) where

import Control.Monad.IO.Class (liftIO)
import Data.ByteString.Char8 qualified as BS8
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Encoding qualified as T
import Foreign.Marshal.Array (peekArray)
import Foreign.Ptr (Ptr)
import Foreign.StablePtr (StablePtr, deRefStablePtr, newStablePtr)
import Foreign.Storable (poke)
import Generated.Janet (Janet, JanetCFunction (..))
import Generated.Janet.Safe (janet_def, janet_wrap_cfunction, janet_wrap_nil)
import HsBindgen.Runtime.LibC (Int32)
import HsBindgen.Runtime.PtrConst (unsafeFromPtr)
import Janet (JanetEnv (..))
import Janet.Marshal (FromJanet (..), ToJanet (..))
import Janet.Monad (MonadJanet (..))
import System.IO (hPutStrLn, stderr)

-- | Any Haskell value that can act as a registered Janet function's
-- implementation: a curried function of any fixed arity terminating in
-- @m b@ (each argument converted via 'FromJanet', the result via
-- 'ToJanet'), or a 'Variadic' function taking the whole argument list at
-- once.
class JanetFunction m f where
    -- | Apply a 'JanetFunction' to a call's raw argument list, converting
    -- arguments and the result as needed. Used internally by
    -- 'registerFunction'; most callers won't need to call this directly.
    applyJanetFunction :: f -> [Janet] -> m (Either Text Janet)

instance (MonadJanet m, ToJanet b) => JanetFunction m (m b) where
    applyJanetFunction action [] = Right <$> (action >>= toJanet)
    applyJanetFunction _ _ = pure $ Left "too many arguments"

instance (MonadJanet m, FromJanet a, JanetFunction m f) => JanetFunction m (a -> f) where
    applyJanetFunction f (x : xs) =
        fromJanet x >>= \case
            Left err -> pure $ Left err
            Right a -> applyJanetFunction (f a) xs
    applyJanetFunction _ [] = pure $ Left "not enough arguments"

-- | A Haskell function over Janet's whole, un-curried argument list — for
-- a variadic Janet function (any number of arguments per call), unlike the
-- fixed arity of a plain @a -> b -> ... -> m r@ registration. Reach for
-- 'variadic' instead of this constructor directly when every argument
-- shares one type.
newtype Variadic m = Variadic
    { applyVariadic :: [Janet] -> m (Either Text Janet)
    -- ^ Handle a call's whole raw argument list directly.
    }

instance MonadJanet m => JanetFunction m (Variadic m) where
    applyJanetFunction (Variadic f) = f

-- | Build a 'Variadic' function from a Haskell function over a
-- homogeneously-typed argument list, e.g. summing any number of numbers.
variadic :: (MonadJanet m, FromJanet a, ToJanet b) => ([a] -> m b) -> Variadic m
variadic f = Variadic $ \args ->
    mapM fromJanet args >>= \parsed -> case sequence parsed of
        Left err -> pure $ Left err
        Right as -> Right <$> (f as >>= toJanet)

-- | A named Janet function of any arity, with its argument\/result types
-- hidden — the value type 'registerFunctions' needs to hold a
-- heterogeneous collection of registrations in one 'Map'.
data SomeJanetFunction m = forall f. JanetFunction m f => SomeJanetFunction f

-- The C side (cbits/janet_dynamic_closure.c) builds a fresh libffi closure
-- per registration — a genuine JanetCFunction, with the real by-value
-- struct-return ABI Janet expects, and no fixed count. Each closure is
-- given a StablePtr to its Haskell callback as opaque userdata, and calls
-- back into 'janetHsDispatch' to run it. 'Janet' only ever crosses this
-- boundary through a pointer (never a raw `IO Janet` foreign import,
-- which GHC's FFI can't marshal by value).
type JanetHsCallback = Int32 -> Ptr Janet -> Ptr Janet -> IO ()

foreign import ccall "janet_hs_make_closure"
    c_janetHsMakeClosure :: StablePtr JanetHsCallback -> IO JanetCFunction

foreign export ccall "janet_hs_dispatch"
    janetHsDispatch :: StablePtr JanetHsCallback -> JanetHsCallback

janetHsDispatch :: StablePtr JanetHsCallback -> JanetHsCallback
janetHsDispatch sp argc argv out = do
    callback <- deRefStablePtr sp
    callback argc argv out

-- | Register a Haskell function as a Janet function under the given name.
--
-- A Haskell-side error (wrong arity, a 'FromJanet' conversion failure) is
-- reported to stderr and the call returns @nil@ — it does not panic the
-- Janet fiber. Janet's own error-signaling convention is a C @longjmp@
-- (via @janet_panic@) out of the native call, which is not safe to trigger
-- from a callback the GHC RTS invoked; supporting it properly is future
-- work, not attempted here.
--
-- The registration is never released (its 'StablePtr' and libffi closure
-- both live for the rest of the process) — there's no unregister, matching
-- the rest of this module: a registered function is meant to last the
-- program's lifetime, not come and go.
registerFunction :: forall m f. (MonadJanet m, JanetFunction m f) => Text -> f -> m ()
registerFunction name f = do
    env@(JanetEnv envPtr) <- askJanetEnv
    liftIO $ do
        let callback argc argv outPtr = do
                args <- peekArray (fromIntegral argc) argv
                result <- runJanetWithEnv env (applyJanetFunction f args :: m (Either Text Janet))
                resultValue <- case result of
                    Right v -> pure v
                    Left err -> do
                        hPutStrLn stderr $ "janet-hs: " <> T.unpack name <> ": " <> T.unpack err
                        janet_wrap_nil
                poke outPtr resultValue
        sp <- newStablePtr callback
        cfun <- c_janetHsMakeClosure sp
        BS8.useAsCString (T.encodeUtf8 name)
            $ \cname ->
                BS8.useAsCString "registered from Haskell" $ \cdoc -> do
                    val <- janet_wrap_cfunction cfun
                    janet_def envPtr (unsafeFromPtr cname) val (unsafeFromPtr cdoc)

-- | Register a batch of named Haskell functions at once.
registerFunctions :: MonadJanet m => Map Text (SomeJanetFunction m) -> m ()
registerFunctions = mapM_ (\(name, SomeJanetFunction f) -> registerFunction name f) . Map.toList
