module Main where

import Control.Monad.ST
import Data.Vector
import Data.Vector.Mutable

vecHandle :: IO (Vector Int)
vecHandle = do
    v <- new 1
    write v 0 (1::Int)
    freeze v

vecHandle2 :: ST s (Vector Int)
vecHandle2 = do
    v <- new 1
    write v 0 (1::Int)
    freeze v

main :: IO ()
main = do
  print =<< vecHandle
  print (runST vecHandle2)
