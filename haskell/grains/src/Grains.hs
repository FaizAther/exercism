module Grains (square, total) where

square :: Integer -> Maybe Integer
square n
  | n < 1 || n > 64 =  Nothing
  | otherwise = Just $ square' 1 n
                  where
                    square' acc n'
                      | n' <= 1   = acc
                      | otherwise = square' (2*acc) (n'-1)

total :: Integer
total = unwrap' $ total' 64
  where
    unwrap' :: Maybe Integer -> Integer
    unwrap' (Just x) = x
    unwrap' Nothing  = 0

    total' :: Integer -> Maybe Integer
    total' n = foldl
              (\ma b -> fmap (+) ma <*> square b)
              (square 1) [2..n]
