module Main where

import Control.Monad (forever)
import Control.Monad.IO.Class (liftIO)
import Data.Char qualified as Char
import Data.IORef
import Data.Map.Strict qualified as Map
import Data.Text (Text)
import Data.Text qualified as T
import Janet.Marshal ()
import Janet.Monad
import Janet.Register
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

repl :: JanetM ()
repl = forever $ do
    liftIO $ putStr "-> "
    input <- liftIO getLine
    result <- tryJanet $ eval $ T.pack input
    case result of
        Left err -> liftIO $ hPutStrLn stderr $ show err
        Right _ -> pure ()

demoFunctions :: (Double -> JanetM Double) -> Map.Map Text (SomeJanetFunction JanetM)
demoFunctions memoFib =
    Map.fromList
        [ (T.pack "haskell-quick-sort", SomeJanetFunction quickSortFn)
        , (T.pack "haskell-title-case", SomeJanetFunction titleCaseFn)
        , (T.pack "haskell-sum", SomeJanetFunction (variadic sumFn))
        , (T.pack "haskell-memo-fib", SomeJanetFunction memoFib)
        ]
  where
    quickSortFn :: [Double] -> JanetM [Double]
    quickSortFn = pure . quickSort
    titleCaseFn :: Text -> JanetM Text
    titleCaseFn = pure . titleCase
    sumFn :: [Double] -> JanetM Double
    sumFn = pure . sum

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
