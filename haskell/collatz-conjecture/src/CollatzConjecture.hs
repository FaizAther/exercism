module CollatzConjecture (collatz) where

cGo :: (Integer, Integer) -> Maybe Integer
cGo (c, n) 
  | n <= 0 = Nothing 
  | n == 1 = Just c
  | otherwise = cGo $ go (c, n)
                where
                  go (c', n')
                    | rem n' 2 == 0 = (c'+1, n' `div` 2)
                    | otherwise = (c'+2, (3*n'+1) `div` 2)
     
collatz :: Integer -> Maybe Integer
collatz n = cGo (0, n)
