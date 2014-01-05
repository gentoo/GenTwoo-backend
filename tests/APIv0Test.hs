{-# LANGUAGE OverloadedStrings #-}
module APIv0Test
    ( registerSpecs
    ) where

import TestImport
import Data.Aeson (encode, object, (.=))
import Data.Text (Text, unpack)

testUUID :: Text
testUUID = "foo"

registerTestUUID :: YesodExample App ()
registerTestUUID = request $ do
    setMethod "POST"
    setUrl V0RegisterR
    setRequestBody $ encode $ object ["uuid" .= testUUID]

registerSpecs :: Spec
registerSpecs =
    ydescribe "API v0 register test" $ do

        yit "return 405 for GET" $ do
            get V0RegisterR
            statusIs 405

        yit "return error for invalid JSON" $ do
            request $ do
                setMethod "POST"
                setUrl V0RegisterR
            statusIs 400

        yit "register a machine" $ do
            runDB $ deleteWhere [ MachineUuid ==. (unpack testUUID) ]
            registerTestUUID
            statusIs 200

        yit "never register the same UUID" $ do
            registerTestUUID
            statusIs 403
