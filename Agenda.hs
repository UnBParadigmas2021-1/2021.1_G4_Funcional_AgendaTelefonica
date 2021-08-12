module Agenda where

type Nome = String
type Telefone = String
type Email = String
type Agenda = [(Nome, Telefone, Email)]


agendaItalo = 
    [("Ian", "12345678", "ian@email.com.br"),
    ("Bob", "87654321", "bob@email.com.br"),
    ("Ana", "13131313", "ana@email.com.br")
    ]


--1. Retornar Email e Telefone de um Contato:

dadosContato :: Agenda -> Nome -> IO ()
dadosContato a n = putStr (procuraCompromisso a n)

procuraCompromisso :: Agenda-> Nome -> String
procuraCompromisso [] _nome = mensagemError
procuraCompromisso ((n,_telefone,comp):lista) _nome
  |(_nome == n) = "Email: " ++ comp ++ "      Telefone: " ++ _telefone ++ "\n" ++ procuraCompromisso lista _nome
  |otherwise = procuraCompromisso lista _nome


mensagemError :: String
mensagemError = "" ++  "\n"


--2. Retornar todos os contatos da agenda:

imprimeAgenda :: Agenda -> IO ()
imprimeAgenda a = putStr (mostraTudo a)

mostraTudo :: Agenda -> String
mostraTudo [] = [] ++  "\n"
mostraTudo ((d,h,c):lista) = "Nome: " ++ d ++ "   Telefone: " ++ h ++ "   Email: " ++ c ++ "\n" ++ mostraTudo lista

--3. Inserir na agenda:

{--
insereContato :: Agenda -> (Nome, Telefone, Email) -> Agenda
insereContato (agenda _ _ _) = ""
insereContato agenda _nome _telefone _email = [(_nome, _telefone, _email)] ++ agenda
--}

{--
insereContato :: Agenda -> Nome -> Telefone -> Email -> Agenda
insereContato agenda _nome _telefone _email = [(_nome, _telefone, _email)] ++ agenda
--}

insereContato :: Agenda -> Nome -> Telefone -> Email -> Agenda
insereContato [] _nome _telefone _email = [(_nome, _telefone, _email)]
insereContato (a:xs) _nome _telefone _email = a : insereContato xs _nome _telefone _email