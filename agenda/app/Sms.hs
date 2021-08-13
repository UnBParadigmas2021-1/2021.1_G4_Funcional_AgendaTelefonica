-- {-#LANGUAGE OverloadedStrings #-}
-- module Sms where

-- import Control.Monad.IO.Class(liftIO)
-- import Twilio
-- import Twilio.Messages
-- import Agenda
-- import Data.Tree.Pretty


-- numeroTelefone :: Integer -> Integer
-- numeroTelefone x = mandarSms

-- valorSid :: IO String
-- valorSid = "5bc3a2a9102231039bfd874b106227d6"

-- valorToken :: IO String
-- valorToken = "ACb6e4c74c3843cd0b3331cb1d506f738d"

-- mandarMensagem :: IO()
-- mandarMensagem numeroTelefone mensagem = runTwilio'  valorSid
--                   valorToken $ do
--   let body = PostMessage numeroTelefone "+17033439229" mensagem
--   mensagem <- post body
--   liftIO $ print message

