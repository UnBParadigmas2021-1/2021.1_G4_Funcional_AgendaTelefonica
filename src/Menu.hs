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
        putStrLn "5 - Sair";
        opcao <- getLine;
        case opcao of "1" -> adicionar;
		              "2" -> procurarContato;
		              "3" -> imprimaLista;
		              "4" -> menuEmail;
                      "5" -> writeFile "teste.txt" "" -- excluirContato  putStrLn "Fechando agenda";
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
        menu

-----------------------------------------------------------------------------------------------------------------------------------------
imprimaLista :: IO()
imprimaLista = do
    arquivo <- readFile "Contatos.txt"
    print $imprimi "" $lines arquivo
    menu

-----------------------------------------------------------------------------------------------------------------------------------------
procurarContato :: IO()
procurarContato = do
    putStrLn "digite o nome do contato"
    name <- getLine
    base <- readFile "Contatos.txt"     -- base is the whole file contents as a single string
    print $busca name $lines base
    menu

-----------------------------------------------------------------------------------------------------------------------------------------

excluirContato :: IO()
excluirContato = do
    putStrLn "digite o nome do contato que sera excluido"
    name <- getLine
    base <- readFile "Contatos.txt"     -- base is the whole file contents as a single string
    let a = removeItem name $lines base
    putStrLn (show a)
    writeFile "teste.txt" ""
    -- atualizaContatos
    menu

-----------------------------------------------------------------------------------------------------------------------------------------
menuEmail :: IO()
menuEmail = do
    putStrLn "Menu do Email: "
    putStrLn "1 - Enviar email"
    putStrLn "2 - Historico de email "
    opcao <- getLine;
    case opcao of "1" -> enviarEmail;
		          "2" -> putStrLn "Ainda não implementado";
    menu

-----------------------------------------------------------------------------------------------------------------------------------------
enviarEmail :: IO()
enviarEmail = do
    putStrLn "Digite o nome do contato"
    name <- getLine
    putStrLn "Digite a mensagem"
    mensagem <-getLine
    base <- readFile "Contatos.txt"     -- base is the whole file contents as a single string
    let emailContato = buscaEmail name $lines base
    -- email emailContato mensagem
    menu