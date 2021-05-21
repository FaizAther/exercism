module Yacht (yacht, Category(..)) where

data Category = Ones
              | Twos
              | Threes
              | Fours
              | Fives
              | Sixes
              | FullHouse
              | FourOfAKind
              | LittleStraight
              | BigStraight
              | Choice
              | Yacht

addN :: Int -> Int -> Int -> Int
addN n x m
  | n == m    = x + n
  | otherwise = x

keepN :: [[Int]] -> Int -> [[Int]]
keepN []      n = [[n]]
keepN (l:ls)  n
  | n `elem` l = (l ++ [n]) : ls
  | otherwise = l : keepN ls n

just4 :: [[Int]] -> Int
just4 ls
  | length ls == 2 =  check4 ls
  | otherwise = 0

check4 :: [[Int]] -> Int
check4 [] = 0
check4 (x:xs) =
  if length x == 4
  then sum x
  else check4 xs


yacht :: Category -> [Int] -> Int
yacht Ones xs = foldl (addN 1) 0 xs
yacht Twos xs = foldl (addN 2) 0 xs
yacht Threes xs = foldl (addN 3) 0 xs
yacht Fours xs = foldl (addN 4) 0 xs
yacht Fives xs = foldl (addN 5) 0 xs
yacht Sixes xs = foldl (addN 6) 0 xs
yacht Choice xs = sum xs
yacht FullHouse xs =  let (j:k:js) = foldl keepN [] xs in
                        if (length (j:k:js) == 2) && (length j /= 1 && length j /= 4)
                        then sum xs
                        else 0
yacht FourOfAKind xs =  let js = foldl keepN [] xs
                        in just4 js
yacht Yacht [] = 0
yacht Yacht (x:xs) = if foldl (\b a -> b && a == x) True xs then 50 else 0
yacht _ xs = if length (foldl keepN [] xs) == 5 then 30 else 0
