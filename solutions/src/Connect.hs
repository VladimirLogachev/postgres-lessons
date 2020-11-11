{-# LANGUAGE OverloadedStrings #-}

module Connect where

import Database.PostgreSQL.Typed.Protocol
import qualified Network.Socket as Net
import           Database.PostgreSQL.Typed
import           Database.PostgreSQL.Typed.Query

db :: PGDatabase
db = PGDatabase
  { pgDBAddr = Right $ Net.SockAddrInet 6432 (Net.tupleToHostAddress (127,0,0,1))
  , pgDBName = "demo"
  , pgDBUser = "admin"
  , pgDBPass = "admin"
  , pgDBParams = []
  , pgDBDebug = True
  , pgDBLogMessage = print
  , pgDBTLS = TlsDisabled
  }

runQuery :: PGConnection -> PGSimpleQuery a -> IO [a]
runQuery conn query = pgQuery conn query