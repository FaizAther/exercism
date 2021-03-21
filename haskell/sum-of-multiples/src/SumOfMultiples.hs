module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum $ go factors [1..limit-1]
  where
    go _   []     = []
    go fac (e:es) = [e | any (isFac e) fac] ++ go fac es
      where
        isFac p q = q /= 0 && rem p q == 0

