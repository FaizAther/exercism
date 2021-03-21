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
    nuFold = foldr insertNu M.empty
      where
        insertNu n = M.insertWith (+) n 1
