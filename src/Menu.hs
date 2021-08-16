module Menu (menu)where

import System.IO
import Data.Char  
import Control.Monad
import Agenda
import Email

-- MENU PRINCIPAL

menu :: IO()
menu = do { putStrLn "\n\t\tMenu Principal da Agenda:\n";
        putStrLn "1 - Cadastrar um novo contato";
        putStrLn "2 - Achar um contato";
        putStrLn "3 - Listar todos os contatos";
        putStrLn "4 - Excluir contato";
        putStrLn "5 - Opções de Email";
        putStrLn "6 - Sair";
        opcao <- getLine;
        case opcao of "1" -> adicionar;
		              "2" -> procurarContato;
		              "3" -> imprimaLista;
                      "4" -> excluirContato;
		              "5" -> menuEmail;
                      "6" -> putStrLn "Fechando agenda";
	}
-----------------------------------------------------------------------------------------------------------------------------------------

-- ADICIONAR CONTATO

adicionar :: IO()
adicionar = do
        putStr("\n\n\n\n\n\n\n\n\n\n")
        putStr("Escreva o nome:\n")
        nome <- getLine
        putStr("Escreva o numero:\n")
        numero <- getLine
        putStr("Escreva o email:\n")
        email <- getLine
        adicionarContato nome numero email
        putStr("Adicionado com sucesso!\n\n")
        menu
-----------------------------------------------------------------------------------------------------------------------------------------

-- BUSCAR POR CONTATO

procurarContato :: IO()
procurarContato = do
    putStr("\n\n\n\n\n\n\n\n\n\n")
    putStrLn "Digite o nome do contato:"
    name <- getLine
    base <- readFile "Contatos.txt"     
    print $busca name $lines base
    putStr("\n")
    menu
-----------------------------------------------------------------------------------------------------------------------------------------

-- IMPRIR TODOS OS CONTATOS

imprimaLista :: IO()
imprimaLista = do
    putStr("\n\n\n\n\n\n\n\n\n\n")
    arquivo <- readFile "Contatos.txt"
    print $imprimi "" $lines arquivo
    menu
-----------------------------------------------------------------------------------------------------------------------------------------

-- EXCLUIR CONTATO

excluirContato :: IO()
excluirContato = do
    putStr("\n\n\n\n\n\n\n\n\n\n")
    putStrLn "Digite o nome do contato que sera excluido:"
    name <- getLine
    base <- readFile "Contatos.txt"
    let contatosLista = removeContato name $lines base
    putStrLn (show contatosLista)
    writeFile "Contatos.txt" ""
    atualizaContatos contatosLista
    putStr("Contato excluido!\n\n")
    menu
-----------------------------------------------------------------------------------------------------------------------------------------

-- MENU EMAIL

menuEmail :: IO()
menuEmail = do
    putStr("\n\n\n\n\n\n\n\n\n\n")
    putStrLn "Menu do Email: "
    putStrLn "1 - Enviar email"
    putStrLn "2 - Historico de email "
    opcao <- getLine;
    case opcao of "1" -> enviarEmail;
		          "2" -> putStrLn "Ainda não implementado";
    putStr("\n")
    menu
-----------------------------------------------------------------------------------------------------------------------------------------

-- ENVIAR EMAIL

enviarEmail :: IO ()
enviarEmail = do
--              email
                menu
