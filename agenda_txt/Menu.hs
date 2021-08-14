module Menu (menu) where

import System.IO
import Data.Char  
import Control.Monad
import Agenda

main :: IO()
main = do { putStrLn "Menu Principal da Agenda: ";
        putStrLn "1 - Cadastrar um novo contato";
        putStrLn "2 - Achar um contato";
        putStrLn "3 - Listar todos os contatos";
        putStrLn "4 - Opções de SMS";
	    putStrLn "5 - Opções de Email";
        opcao <- getLine;
        case opcao of "1" -> adicionar;
			"2" -> procurarContato;
			"3" -> imprimaLista;
			"4" -> putStrLn "Fechando agenda";
			"5" -> putStrLn "Fechando agenda";
	}