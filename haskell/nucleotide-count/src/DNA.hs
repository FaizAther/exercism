module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map as M (Map, empty, insertWith)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = fmap nuFold mapConvert
  where
    mapConvert = mapM convert xs
      where
        convert 'G' = Right G
        convert 'C' = Right C
        convert 'T' = Right T
        convert 'A' = Right A
        convert _   = Left "error"
    nuFold = foldl' insertNu M.empty
      where
        insertNu m n = M.insertWith (+) n 1 m
        foldl' _ z []     = z
        foldl' f z (e:es) = let f' = f z e 
                             in seq f' $ foldl' f f' es
