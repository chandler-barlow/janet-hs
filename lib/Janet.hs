module Janet where

import Control.Monad
import Foreign.C.String
import Foreign.Ptr
import Generated.Janet (JanetTable)
import Generated.Janet.Safe
import HsBindgen.Runtime.PtrConst

newtype JanetEnv = JanetEnv (Ptr JanetTable)

-- data JanetValue
--   = JNumber Double
--   | JNil
--   | JBool Bool
--   | JFiber
--   | JString JanetString
--   | JSymbol JanetSymbol
--   | JKeyword JanetKeyword
--   | JArray JanetArray
--   | JTuple JanetTuple
--   | JTable JanetTable
--   | JStruct JanetStruct
--   | JBuffer JanetBuffer
--   -- ^ I think this will end up being
--   | JFunction JanetFunction
--   | JAbstract
--   -- ^ just an alias for void
--   | JPointer

-- -- | A table in janet is just a list of janet keys and janet values
-- newtype JanetTable = JanetTable [(JanetValue, JanetValue)]

-- -- | I think that the only way to make a janet function is to either
-- --
-- -- 1. reference a janet function in the env somehow
-- -- 2. induct source code ( string ) into a janet function
-- data JanetFunction = JanetFunction

-- newtype JanetArray = JanetArray [JanetValue]

-- newtype JanetTuple = JanetTuple [JanetValue]

-- newtype JanetStruct = JanetStruct [(JanetValue, JanetValue)]

withJanet :: (JanetEnv -> IO a) -> IO a
withJanet f = do
    void janet_init
    env <- JanetEnv <$> janet_core_env nullPtr
    res <- f env
    janet_deinit
    pure res

execJanet :: JanetEnv -> String -> IO ()
execJanet (JanetEnv env) code =
    withCString "main" $ \m -> do
        withCString code $ \msg -> do
            void $ janet_dostring env (unsafeFromPtr msg) (unsafeFromPtr m) nullPtr
