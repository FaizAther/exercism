module SumOfMultiples (sumOfMultiples) where

sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = foldl' someF 0 ls
  where
    foldl' _ b []     = b
    foldl' f b (x:xs) = let b' = (b `f` x)
                        in seq b' foldl' f b' xs
    ls = [1..limit-1]
    someF i j = i + anyFac j
    anyFac n
      | any (isFac n) factors = n
      | otherwise             = 0
    isFac p q = q /= 0 && rem p q == 0
