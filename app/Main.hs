module Main where

import Control.Monad.ST
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as MV

main :: IO ()
main = do
  genVectors

--------------------------------------
-- Generating Vectors
--------------------------------------

genVectors = do
  putStrLn "-----------------"
  putStrLn " Generating"
  putStrLn "-----------------"
  
  let x = V.fromList [10, 20, 30, 40]
  putStrLn $ "V.fromList [10, 20, 30, 40] -> " ++ show x

  let x = V.enumFromStepN 10 10 4
  putStrLn $ "V.enumFromStepN 10 10 4 -> " ++ show x

  let x = V.enumFromN 10 4
  putStrLn $ "V.enumFromN 10 4 -> " ++ show x

  let x = V.empty :: V.Vector Int
  putStrLn $ "V.empty -> " ++ show x

  let x = V.singleton 2
  putStrLn $ "V.singleton 2 -> " ++ show x

  let x = V.replicate 10 2
  putStrLn $ "V.replicate 10 2 -> " ++ show x

  let x = V.generate 10 id
  putStrLn $ "V.generate 10 id -> " ++ show x

  let x = V.generate 10 (^2)
  putStrLn $ "V.generate 10 (^2) -> " ++ show x

  let x = V.generate 5 (V.replicate 3)
  putStrLn $ "V.generate 5 (V.replicate 3) -> " ++ show x

  let x = V.take 3 $ V.enumFromTo 0 11
  putStrLn $ "V.take 3 $ V.enumFromTo 0 11 -> " ++ show x

  let x = V.enumFromTo 0 5 V.++ V.enumFromTo 6 10
  putStrLn $ "V.enumFromTo 0 5 V.++ V.enumFromTo 6 10 -> " ++ show x
