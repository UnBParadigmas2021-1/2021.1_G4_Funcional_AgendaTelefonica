module Work where  
import System.IO
import System.Directory  
import Data.List
import Control.Monad
 {--
main = do
 putStr("Digite o que gostaria de fazer?\n")
 putStr("adicionar\n")
 putStr("remover\n")
 putStr("imprimirLista\n")
--}
 -----------------------------------------------------------------------------------------------------------------------------------------

--ADICIONAR UM NOVO CONTATO
adicionar :: IO()
adicionar = do
 putStr("Escreva o nome\n")
 linha <- getLine
 arquivo <- openFile "Compromisso.txt" AppendMode
 hPutStr arquivo linha
 hPutStr arquivo "\n"
 putStr("Escreva o numero\n")
 linha1 <- getLine
 hPutStr arquivo linha1
 hPutStr arquivo "\n"
 putStr("Escreva o email\n")
 linha2 <- getLine
 hPutStr arquivo linha2
 hPutStr arquivo "\n"
 putStr("Adicionado com sucesso\n")
 hFlush arquivo
 hClose arquivo
 -----------------------------------------------------------------------------------------------------------------------------------------
 
 -- IMRIPIR TODA LISTA DE CONTATOS
imprimaLista :: IO()
imprimaLista = do
    arquivo <- readFile "Compromisso.txt"
    print $imprimi "" $lines arquivo
    
imprimi :: String -> [String] -> [[String]]
imprimi name (contato:numero:email:others)| contato /= name = [contato, numero, email]:imprimi name others
                                             | otherwise = imprimi name others -- a different director, scan the rest of the file
imprimi _ _ = [] -- when there's no more records
 -----------------------------------------------------------------------------------------------------------------------------------------
 
--PROCURAR UM CONTATO
procurarContato :: IO()
procurarContato = do
    putStrLn "digite o nome do contato"
    name <- getLine
    base <- readFile "Compromisso.txt"     -- base is the whole file contents as a single string
    print $busca name $lines base

busca :: String -> [String] -> [[String]]
busca name (contato:numero:email:others)| contato == name = [contato, numero, email]:busca name others
                                             | otherwise = busca name others -- a different director, scan the rest of the file
busca _ _ = [] -- when there's no more records
 -----------------------------------------------------------------------------------------------------------------------------------------
{--
--EXCLUI UM CONTATO
excluirContato :: IO()
excluirContato = do
    putStrLn "digite o nome do contato que sera excluido"
    name <- getLine
    base <- readFile "Compromisso.txt"     -- base is the whole file contents as a single string
    print $exclui name $lines base
    

exclui :: String -> [String] -> [[String]]
exclui name (contato:numero:email:others)
 | contato /= name = arquivo <- openFile "Lixo.txt" AppendMode
  hPutStr arquivo contato
  hPutStr arquivo "\n"
  hPutStr arquivo numero
  hPutStr arquivo "\n"
  hPutStr arquivo email
  hPutStr arquivo "\n"
  hFlush arquivo
  hClose arquivo
  [contato, numero, email]:exclui name others
 | otherwise = exclui name others -- a different director, scan the rest of the file
exclui _ _ = [] -- when there's no more records
 -----------------------------------------------------------------------------------------------------------------------------------------


--}




