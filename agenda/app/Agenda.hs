module Agenda where
    
contatos = 
    [("Joao", ("1254", "jv@gmail.com"))
    , ("Ana", ("451", "ana@gmail.com"))
    ]

acharContato :: (Eq k) => k -> [(k, (t,e))] ->  e
acharContato key [] = error ("Contato não encontrado")
acharContato key ((k, (t, e)):xs) | key == k = e
                                  | otherwise = acharContato key xs