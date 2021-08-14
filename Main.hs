module Main where

import System.IO
import Data.Char  
import Control.Monad
import Agenda

main :: IO()
main = do { putStrLn "Menu Principal da Agenda: ";
        putStrLn "1 - Cadastrar um novo contato";
        putStrLn "2 - Achar um contato";
        putStrLn "3 - Listar todos os contatos";
	putStrLn "4 - Opções de Email";
        putStrLn "5 - Sair da Agenda";
        opcao <- getLine;
        case opcao of   "1" -> subMenuInsere;
			"2" -> subMenuAchar;
			"3" -> subMenuPrintar;
			"4" -> putStrLn "Fechando agenda";
                        "5" -> putStrLn "Fechando agenda";

	}

{--subMenuInsere :: IO()
subMenuInsere = do { putStrLn "Inserindo contato...";
        putStrLn "Digite o nome";
        opcao1 <- getLine;
        putStrLn "Digite o telefone";
        opcao2 <- getLine;
        putStrLn "Digite o e-mail";
        opcao3 <- getLine;
        insereAgenda opcao1 opcao2 opcao3
	}
--}
subMenuInsere :: IO()
subMenuInsere = do  
    putStrLn "Insira o nome"  
    name <- getLine  
    putStrLn "Insira o telefone"  
    phone <- getLine 
    putStrLn "Insira o e-mail"  
    email <- getLine  
    putStrLn $ "hey " ++ name ++ ", nice to meet you!\n" ++ "Phone: " ++ phone ++ " Email: " ++ email
    let agenda = insereAgenda name phone email
    putStrLn (show agenda)
    main

subMenuAchar :: IO()
subMenuAchar = do { putStrLn "Nome do contato";
        opcao <- getLine;
        encontraContato opcao
	}

subMenuPrintar :: IO()
subMenuPrintar = do { putStrLn "Carregando Agenda...";
        preImprime "a"
	}
