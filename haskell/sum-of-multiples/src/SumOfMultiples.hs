module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ [ y | y <- ls, anyFac y ]
  where
    ls = [1..limit-1]
    anyFac n = any (isFac n) factors
    isFac p q = q /= 0 && rem p q == 0
