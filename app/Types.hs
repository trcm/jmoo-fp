{-# LANGUAGE OverloadedStrings #-}
module Types where

import Data.Text
import Data.Aeson

type URL = String

data KeycloakToken = KeycloakToken
  {
    accessToken :: String,
    expiresIn :: Int,
    refreshExpiresIn :: Int,
    refreshToken:: String,
    idToken :: String
  } deriving Show

instance FromJSON KeycloakToken where
  parseJSON = withObject "KeycloakToken" $ \v -> do
    accessToken <- v .: "access_token"
    expiresIn <- v.: "expires_in"
    refreshExpiresIn <- v.: "refresh_expires_in"
    refreshToken <- v.: "refresh_token"
    idToken <- v.: "id_token"
    return $ KeycloakToken accessToken expiresIn refreshExpiresIn refreshToken idToken