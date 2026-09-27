module Janet
    ( JanetEnv (..)
    , withJanet
    , execJanet
    , peekJanetStringBytes
    ) where

import Control.Exception (bracket, bracket_)
import Control.Monad
import Data.ByteString (ByteString)
import Data.ByteString.Unsafe qualified as BSU
import Data.IORef
import Foreign.C.String
import Foreign.Ptr
import Generated.Janet (JanetString (..), JanetTable)
import Generated.Janet.Safe
import HsBindgen.Runtime.PtrConst (unsafeFromPtr, unsafeToPtr)
import System.IO.Unsafe (unsafePerformIO)

newtype JanetEnv = JanetEnv (Ptr JanetTable)

-- | Tracks whether 'withJanet' has already run once in this process.
--
-- Empirically, a second @janet_init@\/@janet_deinit@ cycle in the same
-- process corrupts subsequently-allocated Janet values (strings observed
-- going back as all-NUL; presumably any heap-allocated, pointer-backed
-- type is affected, while inline scalars like numbers and booleans are
-- not). This looks like Janet (or at least this build of it) not fully
-- resetting some process-global state on deinit. Until that's tracked
-- down upstream, we guard against it outright rather than let it corrupt
-- data silently.
{-# NOINLINE janetSessionStarted #-}
janetSessionStarted :: IORef Bool
janetSessionStarted = unsafePerformIO (newIORef False)

-- | Run an action against a fresh Janet interpreter.
--
-- Only one 'withJanet' session is supported per process (see
-- 'janetSessionStarted'); a second call raises an error rather than
-- silently corrupting later Janet values. Run all Janet code for a
-- program within a single session.
--
-- Janet values returned from the C API are only kept alive by the Janet
-- garbage collector while they're reachable from a GC root (the value
-- stack, a table, an explicit @janet_gcroot@, ...). A 'Janet' value held
-- purely on the Haskell side is not a root, so it can be collected out
-- from under us the moment another Janet allocation triggers a
-- collection. Rather than requiring every caller to root and unroot
-- values by hand, we lock the collector for the whole session: no
-- collection happens while inside 'withJanet', so any 'Janet' value is
-- safe to hold onto for as long as the session lasts. The tradeoff is
-- that a long-lived session accumulates garbage instead of collecting
-- it; this is fine for running scripts, less so for an interpreter kept
-- alive indefinitely.
withJanet :: (JanetEnv -> IO a) -> IO a
withJanet f = do
    alreadyStarted <- atomicModifyIORef' janetSessionStarted (\started -> (True, started))
    when alreadyStarted $
        error
            "withJanet: only one Janet session is supported per process \
            \(a second janet_init/janet_deinit cycle corrupts later Janet \
            \values). Run all Janet code within a single withJanet/runJanetM session."
    bracket_ (void janet_init) janet_deinit $ do
        env <- JanetEnv <$> janet_core_env nullPtr
        bracket janet_gclock janet_gcunlock $ \_ -> f env

execJanet :: JanetEnv -> String -> IO ()
execJanet (JanetEnv env) code =
    withCString "main" $ \m -> do
        withCString code $ \msg -> do
            void $ janet_dostring env (unsafeFromPtr msg) (unsafeFromPtr m) nullPtr

-- | Read the bytes of a 'JanetString'.
--
-- Janet strings are NUL-terminated for C interop, so this reads up to the
-- first NUL byte. Strings containing embedded NUL bytes are not supported.
peekJanetStringBytes :: JanetString -> IO ByteString
peekJanetStringBytes (JanetString ptr) =
    BSU.unsafePackCString $ castPtr $ unsafeToPtr ptr
