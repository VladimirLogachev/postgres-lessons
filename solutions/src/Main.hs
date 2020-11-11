{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeApplications      #-}
{-# LANGUAGE TypeOperators         #-}
{-# OPTIONS_GHC -fno-warn-partial-type-signatures #-}

module Main where

import           Control.Monad.IO.Class          (liftIO)
import           Control.Monad.Logger
import           Data.Int                        (Int32)
import           Data.Proxy
import qualified Data.Text                       as T

import           Database.PostgreSQL.Typed
import           Database.PostgreSQL.Typed.Query
-- import           Mu.GraphQL.Server
-- import           Mu.Schema
-- import           Mu.Server
-- import           Network.Wai.Handler.Warp          (run)
-- import           Network.Wai.Middleware.AddHeaders (addHeaders)

import           Connect
-- import           Schema

useTPGDatabase db -- compile time connection


main :: IO ()
main = do
  putStrLn "hello world"
  runStdoutLoggingT $ do
    conn <- liftIO $ pgConnect db
    liftIO $ print "hi"
    -- aircrafts <- runQuery conn [pgSQL|
    --     SELECT id, name FROM author
    --     ORDER BY name
    --   |]


-- allAuthors :: IO [(Integer, T.Text)]
allAuthors conn = runQuery conn [pgSQL|
  SELECT * from aircrafts;
|]
