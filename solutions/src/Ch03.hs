{-# LANGUAGE DataKinds             #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE PartialTypeSignatures #-}
{-# LANGUAGE QuasiQuotes           #-}
{-# LANGUAGE TemplateHaskell       #-}
{-# LANGUAGE TypeApplications      #-}
{-# LANGUAGE TypeOperators         #-}

module Ch03 where

import           Connect
import           Data.Int                  (Int32, Int16, Int64)
import qualified Data.Text                 as T
import           Database.PostgreSQL.Typed

useTPGDatabase db -- compile time connection

{-| just a test -}
solution0 :: PGConnection ->  IO [(T.Text, T.Text, Int32)]
solution0 conn = pgQuery conn [pgSQL|
  SELECT * from aircrafts;
|]

{-| Should return an error -}
solution1a :: PGConnection ->  IO [()]
solution1a conn = pgQuery conn [pgSQL|
  INSERT INTO aircrafts
    VALUES ('SU9', 'Sukhoi SuperJet-100', 3000);
|]

{-| Should be successful -}
solution1b :: PGConnection ->  IO [()]
solution1b conn = pgQuery conn [pgSQL|
  INSERT INTO aircrafts
    VALUES ('SU0', 'Sukhoi SuperJet-100', 3000);
|]

{-| Should be successful -}
solution1c :: PGConnection ->  IO [(T.Text, T.Text, Int32)]
solution1c conn = pgQuery conn [pgSQL|
  INSERT INTO aircrafts
    VALUES ('SU7', 'Sukhoi SuperJet-100', 3000)
    RETURNING *;
|]

