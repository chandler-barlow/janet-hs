{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TypeApplications #-}

module Janet.Marshal
    ( ToJanet (..)
    , FromJanet (..)
    , evalAs
    ) where

import Control.Monad.IO.Class (liftIO)
import Data.ByteString qualified as BS
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.Encoding qualified as T
import Foreign.C.Types (CDouble)
import Foreign.Ptr (castPtr)
import Generated.Janet
    ( Janet (..)
    , JanetType
    , pattern JANET_BOOLEAN
    , pattern JANET_NIL
    , pattern JANET_NUMBER
    , pattern JANET_STRING
    )
import Generated.Janet.Safe
    ( janet_string
    , janet_to_string
    , janet_wrap_boolean
    , janet_wrap_nil
    , janet_wrap_number
    , janet_wrap_string
    )
import HsBindgen.Runtime.PtrConst (unsafeFromPtr)
import HsBindgen.Runtime.Support qualified as BG
import Janet (peekJanetStringBytes)
import Janet.Monad (MonadJanet, eval)

-- | Convert a Haskell value into a Janet value.
class ToJanet a where
    toJanet :: MonadJanet m => a -> m Janet

-- | Convert a Janet value into a Haskell value. Returns @Left@ with a
-- description of the mismatch (e.g. the actual 'JanetType' found) on failure.
class FromJanet a where
    fromJanet :: MonadJanet m => Janet -> m (Either Text a)

typeMismatch :: String -> JanetType -> Either Text a
typeMismatch expected actual =
    Left
        $ "expected "
        <> T.pack expected
        <> ", got a Janet value of a different type ("
        <> T.pack (show actual)
        <> ")"

instance ToJanet () where
    toJanet () = liftIO janet_wrap_nil

instance FromJanet () where
    fromJanet v = pure $ case janet_type v of
        JANET_NIL -> Right ()
        other -> typeMismatch "nil" other

instance ToJanet Bool where
    toJanet b = liftIO $ janet_wrap_boolean $ if b then 1 else 0

instance FromJanet Bool where
    fromJanet v = pure $ case janet_type v of
        JANET_BOOLEAN -> Right $ BG.getField @"janet_as_integer" (janet_as v) /= 0
        other -> typeMismatch "boolean" other

instance ToJanet Double where
    toJanet d = liftIO $ janet_wrap_number $ realToFrac d

instance FromJanet Double where
    fromJanet v = pure $ case janet_type v of
        JANET_NUMBER -> Right $ realToFrac @CDouble $ BG.getField @"janet_as_number" $ janet_as v
        other -> typeMismatch "number" other

instance ToJanet Text where
    toJanet t = liftIO
        $ BS.useAsCStringLen (T.encodeUtf8 t)
        $ \(ptr, len) ->
            janet_string (unsafeFromPtr $ castPtr ptr) (fromIntegral len) >>= janet_wrap_string

instance FromJanet Text where
    fromJanet v = case janet_type v of
        JANET_STRING -> do
            bytes <- liftIO $ janet_to_string v >>= peekJanetStringBytes
            pure $ case T.decodeUtf8' bytes of
                Left err -> Left $ "Janet string was not valid UTF-8: " <> T.pack (show err)
                Right t -> Right t
        other -> pure $ typeMismatch "string" other

instance ToJanet a => ToJanet (Maybe a) where
    toJanet Nothing = liftIO janet_wrap_nil
    toJanet (Just x) = toJanet x

instance FromJanet a => FromJanet (Maybe a) where
    fromJanet v = case janet_type v of
        JANET_NIL -> pure $ Right Nothing
        _ -> fmap Just <$> fromJanet v

-- | Evaluate a string of Janet source and convert the result.
evalAs :: (MonadJanet m, FromJanet a) => Text -> m (Either Text a)
evalAs code = eval code >>= fromJanet
