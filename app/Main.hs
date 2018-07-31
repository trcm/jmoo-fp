{-# LANGUAGE OverloadedStrings #-}

module Main
where
--
import           Types

import           Data.Aeson                     ( decode )
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

keycloakURL :: URL
keycloakURL =
  "http://localhost:8087/auth/realms/master/protocol/openid-connect/token"

postIdentityToken :: IO (Maybe KeycloakToken)
postIdentityToken = do
  res <- postWith jheader keycloakURL jBody
  return $ decode (res ^. responseBody)
