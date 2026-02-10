module Janet.Monad where

-- import Control.Monad.IO.Class (MonadIO)
-- import Data.Text qualified as T

-- newtype JanetT m a = JanetT { runJanetT :: m a }

-- data JanetConfig = JanetConfig

-- class MonadIO m => MonadJanet m where
--   runJanet :: JanetConfig -> JanetT m a -> m a
--   exec :: MonadJanet m => JanetArg -> T.Text -> m JanetValue
--   apply :: MonadJanet m => JanetFunction -> JanetArg -> m JanetValue

-- class ToJanet a where
--   toJanet :: ToJanet a => a -> JanetValue

-- class FromJanet a where
--   fromJanet :: FromJanet a => JanetValue -> Either JanetParseError a

-- newtype JanetParseError = JanetParseError T.Text

-- class ToJanet a where
--   toJanet :: a -> JanetValue

-- data JanetArg
--   = forall a. ToJanet a =>  JanetArg a JanetArg
--   | JanetDone
