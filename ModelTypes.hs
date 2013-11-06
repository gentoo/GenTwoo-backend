module ModelTypes where

import Prelude
import Yesod

data Event = Install | Uninstall
           deriving (Show, Read, Eq)
derivePersistField "Event"
