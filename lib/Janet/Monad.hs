{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Janet.Monad
    ( JanetM
    , runJanetM
    , runJanetMEither
    , MonadJanet (..)
    , JanetException (..)
    , eval
    ) where

import Control.Exception (Exception, throwIO, try)
import Control.Monad.IO.Class (MonadIO, liftIO)
import Control.Monad.Trans.Reader (ReaderT (..), ask, runReaderT)
import Data.ByteString qualified as BS
import Data.ByteString.Char8 qualified as BS8
import Data.Text (Text)
import Data.Text.Encoding qualified as T
import Data.Text.Encoding.Error qualified as T
import Foreign.Marshal.Alloc (alloca)
import Foreign.Storable (peek)
import Generated.Janet (Janet)
import Generated.Janet.Safe (janet_dostring, janet_to_string)
import HsBindgen.Runtime.PtrConst (unsafeFromPtr)
import Janet (JanetEnv (..), peekJanetStringBytes, withJanet)

-- | A computation running against a single Janet interpreter instance.
newtype JanetM a = JanetM (ReaderT JanetEnv IO a)
    deriving newtype (Functor, Applicative, Monad, MonadIO)

-- | Any monad with access to a running Janet interpreter.
--
-- 'JanetM' is the concrete, ready-to-use instance. Embed Janet effects
-- into your own monad stack (e.g. a @ReaderT AppEnv IO@ with an app-level
-- environment) by writing a 'MonadJanet' instance for it, rather than
-- hard-coding application code against 'JanetM'.
class MonadIO m => MonadJanet m where
    -- | The Janet environment table this computation is running against.
    askJanetEnv :: m JanetEnv

    -- | Catch a 'JanetException' from a computation without ending the
    -- session, unlike 'runJanetMEither' (which starts a whole new session).
    tryJanet :: m a -> m (Either JanetException a)

    -- | Re-enter this monad given just the environment it was running
    -- against, without going through this monad's own top-level runner.
    --
    -- This is what lets a Janet-native callback (a C function pointer,
    -- invoked directly by the interpreter with no Haskell monad context
    -- of its own) call back into @m@: 'Janet.Register.registerFunction'
    -- captures the environment once at registration time and uses this to
    -- re-enter @m@ on every subsequent call.
    runJanetWithEnv :: JanetEnv -> m a -> IO a

instance MonadJanet JanetM where
    askJanetEnv = JanetM ask
    tryJanet (JanetM (ReaderT g)) = JanetM $ ReaderT $ try . g
    runJanetWithEnv env (JanetM r) = runReaderT r env

runJanetM :: JanetM a -> IO a
runJanetM (JanetM m) = withJanet $ runReaderT m

runJanetMEither :: JanetM a -> IO (Either JanetException a)
runJanetMEither = try . runJanetM

-- | A Janet parse, compile, or runtime error.
--
-- 'janetExceptionMessage' is produced with @janet_to_string@, which renders
-- any Janet value (not just strings) to text.
data JanetException = JanetException
    { janetExceptionValue :: Janet
    , janetExceptionMessage :: Text
    }

instance Show JanetException where
    show e = "Janet error: " <> show (janetExceptionMessage e)

instance Exception JanetException

-- | Evaluate a string of Janet source, returning the last expression's
-- value. Throws 'JanetException' on a parse, compile, or runtime error.
eval :: MonadJanet m => Text -> m Janet
eval code = do
    JanetEnv envPtr <- askJanetEnv
    liftIO
        $ BS8.useAsCString (BS8.pack "janet-hs")
        $ \sourcePath ->
            BS.useAsCString (T.encodeUtf8 code) $ \codeCStr ->
                alloca $ \outPtr -> do
                    status <-
                        janet_dostring
                            envPtr
                            (unsafeFromPtr codeCStr)
                            (unsafeFromPtr sourcePath)
                            outPtr
                    result <- peek outPtr
                    case status of
                        0 -> pure result
                        _ -> do
                            msgBytes <- janet_to_string result >>= peekJanetStringBytes
                            throwIO $ JanetException result $ T.decodeUtf8With T.lenientDecode msgBytes
