module Pangram (isPangram) where
import Data.Char

insert' :: (Ord a) => [a] -> a -> [a]
insert' []     e = [e]
insert' (x:xs) e | e == x    = (x : xs)
                 | e >  x    = (e : x : xs)
                 | otherwise = (x : insert' xs e)

insert'' :: [Char] -> Char -> [Char]
insert'' l e = if isAlpha' e' then
                 insert' l e'
               else l
                 where
                   e' = toLower e
                   isAlpha' ch = ch >= 'a' && ch <= 'z'

isPangram :: String -> Bool
isPangram text = length ( foldl insert'' [] text ) == 26
