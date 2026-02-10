module Main where

import Control.Monad (forever)
import Janet
import System.IO

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    putStrLn "Welcome to janet-hs test repl ..."
    withJanet $ \env -> forever $ do
        putStr "-> "
        input <- getLine
        execJanet env input
