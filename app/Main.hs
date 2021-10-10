module Main where

import Control.Monad.ST
import qualified Data.Vector as V
import qualified Data.Vector.Mutable as MV

main :: IO ()
main = do
  putStrLn "-----------------"
  putStrLn " Generating"
  putStrLn "-----------------"
  genVectors
  
  putStrLn "-----------------"
  putStrLn " Modifing"
  putStrLn "-----------------"
  modVectors

--------------------------------------
-- Generating Vectors
--------------------------------------

genVectors = do
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

  let x = V.iterateN 10 id 1
  putStrLn $ "V.iterateN 10 id 1 -> " ++ show x

  let x = V.iterateN 10 (*2) 1
  putStrLn $ "V.iterateN 10 (*2) 1 -> " ++ show x

modVectors = do
  let x = V.map (^2) (V.enumFromTo 0 10)
  putStrLn $ "V.map (^2) (V.enumFromTo 0 10) -> " ++ show x

  let x = V.filter odd $ V.enumFromTo 0 10
  putStrLn $ "V.filter odd (V.enumFromTo 0 10) -> " ++ show x

  let x = V.foldl (+) 0 $ V.enumFromTo 0 10
  putStrLn $ "V.foldl (+) 0 $ V.enumFromTo 0 10 -> " ++ show x
  
  let x = V.foldl (*) 1 $ V.enumFromTo 1 10
  putStrLn $ "V.foldl (*) 1 $ V.enumFromTo 1 10 -> " ++ show x
  
  let x = V.scanl (+) 0 $ V.enumFromTo 0 10
  putStrLn $ "V.scanl (+) 0 $ V.enumFromTo 0 10 -> " ++ show x

  let x = V.scanl (*) 1 $ V.enumFromTo 1 10
  putStrLn $ "V.scanl (*) 1 $ V.enumFromTo 1 10 -> " ++ show x

  let x = V.zip (V.enumFromTo 1 10) (V.enumFromTo 1 10)
  putStrLn $ "V.zip (V.enumFromTo 1 10) (V.enumFromTo 1 10) -> " ++ show x
