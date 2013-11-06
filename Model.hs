module Model where

import Prelude
import Yesod
import ModelTypes
import Data.Time (UTCTime)
import Database.Persist.Quasi

share [mkPersist sqlOnlySettings, mkMigrate "migrateAll"]
    $(persistFileWith lowerCaseSettings "config/models")
