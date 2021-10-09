module Main where

import Control.Monad.ST
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as MV
-- import qualified Data.Vector.Unboxed as V
-- import qualified Data.Vector.Unboxed.Mutable as MV

vecHandle :: IO (V.Vector Int)
vecHandle = do
    v <- MV.new 1
    MV.write v 0 (1::Int)
    V.freeze v

vecHandle2 :: ST s (V.Vector Int)
vecHandle2 = do
    v <- MV.new 1
    MV.write v 0 (1::Int)
    V.freeze v

main :: IO ()
main = do
  print =<< vecHandle
  print (runST vecHandle2)
