module Menu (menu) where

import System.IO
import Control.Monad
import Agenda
import Sms

menu :: IO()
menu = do { putStrLn "Menu Principal da Agenda: ";
        putStrLn "1 - Cadastrar um novo contato";
        putStrLn "2 - Listar todos os contatos";
        putStrLn "3 - Opções de SMS";
	putStrLn "4 - Opções de Email";
        opcao <- getLine;
        case opcao of "1" -> cadastroContato;
			"2" -> listarContato;
			"3" -> terceiroSubMenu;
			"4" -> putStrLn "Fechando agenda";
	}

-- cadastroContato :: IO()
-- cadastroContato = do { putStrLn "Digite o nome do contato";
--         nome <- getLine;
--         putStrLn "Digite o numero do contato"
--         telefone <- getLine;
--         putStrLn "Digite o email do contato"
--         email <- getLine
-- 	}

-- listarContato :: IO()
-- listarContato = do { putStrLn "Listando contatos da Agenda";
--         listarContatos aqui
-- 	putStrLn "Aperte 1 para retornar ao menu";
--         opcao <- getLine;
--         case opcao of "1" -> menu;
-- 	}

enviarSms :: IO()
enviarSms = do { putStrLn "Selecione a opção que deseja realizar";
		putStrLn "1 - Ligar para um contato"
		putStrLn "2 - Verificar o historico de ligacao"
		putStrLn "3 - Voltar para o menu"
        opcao <- getLine;
        case opcao of "1" -> mandarSms;
		        "2" -> verHistoricoSmS
			"3" -> menu

	}


verificarHistoricoSms :: IO()
verificarHistoricoSms = do { putStrLn "Listando historico de ligacoes";
		historicoLigacoes 
		
	}

mandarSms :: IO()
mandarSms = do {  putStrLn "Selecione a opção que deseja realizar";
                listarContatos 
                putStrLn "Digite o nome do contato que deseja mandar SMS";
                nome <- getLine
                let contato = acharContato nome
                putStrLn "Digite a mensagem do SMS";
                mensagem <- getLine
                sms contato mensagem

                

}

enviarEmail :: IO()
enviarEmail = do { putStrLn "Selecione a opção que deseja realizar";
		listarContatos
        putStrLn "1 - Enviar email";
        putStrLn "2 - Comprar vida...";
	putStrLn "3 - Nenhuma das opcoes";
        opcao <- getLine;
        case opcao of "1" -> putStrLn "Essa magia soh pode ser utilizada na floresta!";
			"2" -> putStrLn "A vida nao poderah ser utilizada na cidade!";
			"3" -> menu
	}


