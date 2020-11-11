{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}

module Main where

import qualified Ch03
import           Connect
import           Database.PostgreSQL.Typed


showResponseLines :: Show a => PGConnection -> (PGConnection ->  IO [a]) -> IO ()
showResponseLines conn solution = do
  x <- solution conn
  putStrLn "\n------------ response:\n"
  mapM_ print x
  putStrLn "\n\n"

showResponse :: Show a => PGConnection -> (PGConnection ->  IO a) -> IO ()
showResponse conn solution = do
  x <- solution conn
  putStrLn "\n------------ response:\n"
  print x
  putStrLn "\n\n"

main :: IO ()
main = do
  putStrLn "\n------------ app started\n"
  conn <- pgConnect db
  putStrLn "\n------------ connected to db\n"
  showResponse conn Ch03.solution1c

-- TODO: catch an error