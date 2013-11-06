{-# LANGUAGE TupleSections, OverloadedStrings, RecordWildCards #-}
{-# LANGUAGE DeriveGeneric, ScopedTypeVariables #-}
module Handler.APIv0 where

import Import
import Control.Monad (when)
import Data.Time (getCurrentTime)
import GHC.Generics

data MachineParam = MachineParam { uuid :: String }
                  deriving Generic
instance FromJSON MachineParam

postV0RegisterR :: Handler Value
postV0RegisterR = do
  param <- parseJsonBody_
  checkUUID param
  time  <- liftIO getCurrentTime
  result <- runDB . insertUnique $ Machine (uuid param) time time
  when (result == Nothing) $
    permissionDenied "Specified UUID already exist"
  returnJson $ object [ "status" .= ("registered" :: Text) ]
  where checkUUID (MachineParam {..})
          | uuid == "" = invalidArgs ["Invalid UUID"]
          | otherwise = return ()
