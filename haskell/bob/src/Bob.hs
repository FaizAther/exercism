module Bob (responseFor) where

isAlphaL :: Char -> Bool
isAlphaL ch = (ch >= 'a' && ch <= 'z')

isAlphaH :: Char -> Bool
isAlphaH ch = (ch >= 'A' && ch <= 'Z')

isCap :: Char -> Bool
isCap ch = ((ch >= 'A' && ch <= 'Z') || (not (isAlphaL ch)))

isWhat :: (Char -> Bool) -> (Bool -> Bool -> Bool) -> Bool -> [Char] -> Bool
isWhat f op base = foldr (\ch -> op (f ch)) base

isYell :: [Char] -> Bool
isYell = isWhat isCap (&&) True

anyAlpha :: [Char] -> Bool
anyAlpha = isWhat isAlphaH (||) False

isWhitespace :: Char -> Bool
isWhitespace ch = ch == ' ' || ch == '\t' || ch == '\n' || ch == '\r'

isSilent :: [Char] -> Bool
isSilent = isWhat isWhitespace (&&) True

isQ :: [Char] -> Bool
isQ [] = False
isQ xs = xs !! ((length xs) - 1) == '?'

trim :: [Char] -> [Char]
trim = f . f
   where f = reverse . dropWhile isWhitespace

responseFor :: String -> String
responseFor xs
  | isSilent xs               = "Fine. Be that way!"
  | isYell xs && not (isQ xs) 
              && anyAlpha xs  = "Whoa, chill out!"
  | isYell xs && isQ xs
              && anyAlpha xs  = "Calm down, I know what I'm doing!" 
  | isQ (trim xs)             = "Sure."
  | otherwise                 = "Whatever."
