module EmailContato where 

import Agenda

emailContato :: IO()    
emailContato = do
    putStrLn "Digite o nome do contato"
    name <- getLine
    base <- readFile "Contatos.txt"  
    let email = buscaEmail name $lines base
    putStr email