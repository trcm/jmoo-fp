{-# LANGUAGE OverloadedStrings #-}

module Main
where
--
import           Types

import           Data.Aeson
import           Network.Wreq
import           Control.Lens
import           Data.Monoid                    ( (<>) )
--
main :: IO ()
main = putStrLn "hello world"

jheader = defaults & header "Accept" .~ ["application/json"]

jBody =
  [ "username" := ("admin" :: String)
  , "password" := ("password" :: String)
  , "grant_type" := ("password" :: String)
  , "client_id" := ("admin-cli" :: String)
  , "scope" := ("openid" :: String)
  ]

constructUrl :: URL
constructUrl =
  "http://localhost:8087/auth/realms/master/protocol/openid-connect/token"

getIdentityToken :: IO (Maybe KeyCloakTokens)
getIdentityToken = do
  res <- postWith jheader constructUrl jBody 
  print res
  return Nothing
