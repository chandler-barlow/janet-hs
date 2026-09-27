{-# LANGUAGE TypeApplications #-}

module Main where

import Control.Monad.IO.Class (liftIO)
import Data.Char qualified as Char
import Data.IORef
import Data.Map.Strict qualified as Map
import Data.Text (Text)
import Data.Text qualified as T
import Foreign.C.Types (CInt (..))
import Janet.Marshal ()
import Janet.Monad
import Janet.Register
import System.Console.Haskeline
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Welcome to janet-hs test repl ..."
    runJanetM $ do
        memoFib <- liftIO mkMemoFib
        let fns = demoFunctions memoFib
        registerFunctions fns
        liftIO $ putStrLn $ "Registered Haskell functions: " <> T.unpack (T.intercalate (T.pack ", ") (Map.keys fns))
        repl

-- | Arrow-key history and cursor editing come from Haskeline's
-- 'getInputLine' itself — no extra code needed for either. The loop stays
-- in 'IO' (not 'JanetM') because Haskeline's 'InputT' runs over 'IO';
-- 'runJanetWithEnv' re-enters 'JanetM' for each line using the environment
-- captured once up front.
repl :: JanetM ()
repl = do
    env <- askJanetEnv
    liftIO $ runInputT defaultSettings (loop env)
  where
    loop env = do
        minput <- getInputLine "-> "
        case minput of
            Nothing -> pure ()
            Just input -> do
                result <- liftIO $ runJanetWithEnv env $ tryJanet @JanetM $ eval $ T.pack input
                case result of
                    Left err -> liftIO $ hPutStrLn stderr $ show err
                    Right _ -> pure ()
                loop env

demoFunctions :: (Double -> JanetM Double) -> Map.Map Text (SomeJanetFunction JanetM)
demoFunctions memoFib =
    Map.fromList
        [ (T.pack "haskell-quick-sort", SomeJanetFunction quickSortFn)
        , (T.pack "haskell-title-case", SomeJanetFunction titleCaseFn)
        , (T.pack "haskell-sum", SomeJanetFunction (variadic sumFn))
        , (T.pack "haskell-memo-fib", SomeJanetFunction memoFib)
        , (T.pack "exit", SomeJanetFunction exitFn)
        ]
  where
    quickSortFn :: [Double] -> JanetM [Double]
    quickSortFn = pure . quickSort
    titleCaseFn :: Text -> JanetM Text
    titleCaseFn = pure . titleCase
    sumFn :: [Double] -> JanetM Double
    sumFn = pure . sum

-- | Leave the REPL. This calls the C library's @exit@ directly rather than
-- throwing a Haskell exception: by the time this runs, the call stack is
-- [Haskell REPL loop] -> [C: Janet's interpreter] -> [C: the libffi
-- trampoline] -> [Haskell: this function], and a thrown exception has no
-- safe way to unwind back through the C frames in the middle — same class
-- of hazard as why a registered function doesn't call @janet_panic@ (see
-- 'Janet.Register.registerFunction'). A direct, no-unwind process exit
-- sidesteps that entirely.
foreign import ccall unsafe "exit"
    c_exit :: CInt -> IO ()

exitFn :: JanetM ()
exitFn = liftIO $ c_exit 0

-- | The textbook one-liner.
quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (p : xs) = quickSort [x | x <- xs, x < p] ++ [p] ++ quickSort [x | x <- xs, x >= p]

titleCase :: Text -> Text
titleCase = T.unwords . map capitalize . T.words
  where
    capitalize w = case T.uncons w of
        Nothing -> w
        Just (c, rest) -> T.cons (Char.toUpper c) rest

-- | Demonstrates that a registered Haskell function can carry state across
-- Janet calls via a closure — the cache here is shared by every
-- @(haskell-memo-fib n)@ call from the REPL, not recreated per call.
mkMemoFib :: IO (Double -> JanetM Double)
mkMemoFib = do
    cache <- newIORef $ Map.fromList [(0, 0), (1, 1)]
    let go n = do
            cached <- Map.lookup n <$> readIORef cache
            case cached of
                Just v -> pure v
                Nothing -> do
                    a <- go $ n - 1
                    b <- go $ n - 2
                    let v = a + b
                    modifyIORef' cache $ Map.insert n v
                    pure v
    pure $ liftIO . go
