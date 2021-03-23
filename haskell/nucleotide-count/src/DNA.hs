{-# LANGUAGE TupleSections #-}

module DNA (nucleotideCounts, Nucleotide(..)) where

import Data.Map as M (Map, fromListWith)
import Text.Read

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Read)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = fmap nCount mapConvert
  where
    mapConvert = mapM (readEither . (: [])) xs
    nCount es = M.fromListWith (+) $ fmap (,1) es
