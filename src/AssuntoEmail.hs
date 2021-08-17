module AssuntoEmail where

assuntoEmail = do
    putStrLn "Digite um assunto: "
    assunto <- getLine;
    putStr assunto