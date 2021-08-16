module Agenda where  

import System.IO
import System.Directory  
import Data.List
import Control.Monad


 -----------------------------------------------------------------------------------------------------------------------------------------

--ADICIONAR UM NOVO CONTATO

adicionarContato :: String -> String -> String -> IO ()
adicionarContato nome numero email = do
 arquivo <- openFile "Contatos.txt" AppendMode 
 hPutStr arquivo nome
 hPutStr arquivo "\n"
 hPutStr arquivo numero
 hPutStr arquivo "\n"
 hPutStr arquivo email
 hPutStr arquivo "\n"
 hFlush arquivo
 hClose arquivo
 -----------------------------------------------------------------------------------------------------------------------------------------
 
 -- IMRIPIR TODA LISTA DE CONTATOS
   
imprimi :: String -> [String] -> [[String]]
imprimi name (contato:numero:email:others)| contato /= name = [contato, numero, email] :imprimi name others
                                             | otherwise = imprimi name others -- a different director, scan the rest of the file
imprimi _ _ = [] -- when there's no more records

{--f :: [[String]] -> [String]
f xs = do 
         x <- xs
         return $ show x--}

 -----------------------------------------------------------------------------------------------------------------------------------------
 
--PROCURAR UM CONTATO

busca :: String -> [String] -> [[String]]
busca name (contato:numero:email:others)| contato == name = [contato, numero, email]:busca name others
                                             | otherwise = busca name others -- a different director, scan the rest of the file
busca _ _ = [] -- when there's no more records
 -----------------------------------------------------------------------------------------------------------------------------------------
{--
--EXCLUI UM CONTATO

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
--}

removeItem _ []                 = []
removeItem x (contato:numero:email:others) | x == contato    = removeItem x others
                                           | otherwise =  (contato:numero:email:others) : removeItem x others
                                           
 -----------------------------------------------------------------------------------------------------------------------------------------

-- BUSCA EMAIL DE CONTATO

buscaEmail :: String -> [String] -> String
buscaEmail name (contato:numero:email:others)| contato == name = email
                                             | otherwise = buscaEmail name others -- a different director, scan the rest of the file
buscaEmail _ _ = "" -- when there's no more records

-- atualizaContatos :: String -> [String] -> [[String]]
-- atualizaContatos (contato:numero:email:others) | others /= [] = adicionarContato contato numero email
--                                               | otherwise = atualizaContatos others


