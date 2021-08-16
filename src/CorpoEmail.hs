module CorpoEmail where

corpoEmail :: IO ()
corpoEmail = do
    putStrLn "Digite o corpo do email: "
    corpo <- getLine;
    putStr corpo

    