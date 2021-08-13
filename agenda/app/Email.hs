{-# LANGUAGE OverloadedStrings #-}

module Email where
import Network.Mail.SMTP

from       = Address Nothing "email@domain.com"
to         = [Address (Just "Jason Hickner") "email@domain.com"]
cc         = []
bcc        = []
subject    = "email subject"
body       = plainTextPart "email body"
html       = htmlPart "<h1>HTML</h1>"

mail = simpleMail from to cc bcc subject [body, html]

host = "172.18.0.1"

main = sendMail host mail

