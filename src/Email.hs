{-# LANGUAGE OverloadedStrings #-}
module Email where

import Control.Monad (when)
import Control.Exception (bracket)
import Network.HaskellNet.SMTP.SSL
import EmailContato 
import AssuntoEmail
import CorpoEmail
import Agenda
{-- 
email :: IO ()
email = bracket
         (connectSMTPSSL "smtp.gmail.com")
         closeSMTP $ \conn ->
           do success <- authenticate LOGIN
                                      "paradigmasagenda@gmail.com"
                                      "unb12345#"
                                      conn
              when success
                   $ sendPlainTextMail "geraldov932@gmail.com" "paradigmasagenda@gmail.com" "assuntoEmail" "corpoEmail" conn
