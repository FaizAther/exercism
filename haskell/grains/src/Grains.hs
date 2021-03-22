module Grains (square, total) where

square :: Integer -> Maybe Integer
square n = if n < 1 || n > 64 then Nothing else Just $ square' n
  where
    square' n' = if n' > 1 then 2 * square'(n'-1) else 1

total' :: [Maybe Integer]
total' = map square [1..64]

maybeAdd :: Maybe Integer -> Maybe Integer -> Maybe Integer
maybeAdd Nothing _ = Nothing
maybeAdd _ Nothing = Nothing
maybeAdd (Just n) (Just m) = Just $ n + m

total'' :: Maybe Integer
total'' = foldl maybeAdd (Just 0) total'

total :: Integer
total = do
  case total'' of
    Just x -> x
    Nothing -> -1 
