module Menu (menu)where

import System.IO
import Data.Char  
import Control.Monad
import Agenda

menu :: IO()
menu = do { putStrLn "Menu Principal da Agenda: ";
        putStrLn "1 - Cadastrar um novo contato";
        putStrLn "2 - Achar um contato";
        putStrLn "3 - Listar todos os contatos";
        putStrLn "4 - Opções de Email";
        putStrLn "5 - Opções de SMS";
        putStrLn "6 - Sair";
        opcao <- getLine;
        case opcao of "1" -> adicionar;
		      "2" -> procurarContato;
		      "3" -> imprimaLista;
		      "4" -> putStrLn "Fechando agenda";
		      "5" -> putStrLn "Funcionalidade não implementada";
                      "6" -> putStrLn "Fechando agenda";
	}

-----------------------------------------------------------------------------------------------------------------------------------------
adicionar :: IO()
adicionar = do
        putStr("Escreva o nome\n")
        nome <- getLine
        putStr("Escreva o numero\n")
        numero <- getLine
        putStr("Escreva o email\n")
        email <- getLine
        adicionarContato nome numero email
        putStr("Adicionado com sucesso\n")

-----------------------------------------------------------------------------------------------------------------------------------------
imprimaLista :: IO()
imprimaLista = do
    arquivo <- readFile "Compromisso.txt"
    print $imprimi "" $lines arquivo
    menu

-----------------------------------------------------------------------------------------------------------------------------------------
procurarContato :: IO()
procurarContato = do
    putStrLn "digite o nome do contato"
    name <- getLine
    base <- readFile "Compromisso.txt"     -- base is the whole file contents as a single string
    print $busca name $lines base
    menu

-----------------------------------------------------------------------------------------------------------------------------------------
{--
excluirContato :: IO()
excluirContato = do
    putStrLn "digite o nome do contato que sera excluido"
    name <- getLine
    base <- readFile "Compromisso.txt"     -- base is the whole file contents as a single string
    print $exclui name $lines base
--}

-----------------------------------------------------------------------------------------------------------------------------------------
sms = do
    putStrLn "Funcionalidade não implementada"
    menu