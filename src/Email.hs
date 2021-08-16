{-# LANGUAGE OverloadedStrings #-}
module Email where

import Control.Monad (when)
import Control.Exception (bracket)
import Network.HaskellNet.SMTP.SSL

email :: IO ()
email emailContato assunto mensagem = bracket
         (connectSMTPSSL "smtp.gmail.com")
         closeSMTP $ \conn ->
           do success <- authenticate LOGIN
                                      "paradigmasagenda@gmail.com"
                                      "unb12345#"
                                      conn
              when success
                   $ sendPlainTextMail emailContato "paradigmasagenda@gmail.com" assunto mensagem conn