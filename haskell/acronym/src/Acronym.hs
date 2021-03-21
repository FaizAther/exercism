module Acronym (abbreviate) where
import qualified Data.Text as T
import           Data.Text (Text)


abbreviate :: Text -> Text
abbreviate t = T.filter (\c -> (c >= 'A') && (c <= 'Z')) t

