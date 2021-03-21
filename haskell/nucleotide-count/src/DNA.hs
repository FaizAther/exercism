module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map as M (Map, singleton, empty, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

convert :: Char -> Either String Nucleotide
convert 'G' = Right G
convert 'C' = Right C
convert 'T' = Right T
convert 'A' = Right A
convert _ = Left "error"

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = go (mapM convert xs)
  where
        go (Right ls) = Right $ go' ls
          where
            go' []       = M.empty
            go' [l]      = M.singleton l 1
            go' (l':ls') = M.insertWith (+) l' 1 $ go' ls'
        go (Left ls) = Left ls
