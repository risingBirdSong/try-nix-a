module Core where
    
import Control.Monad.Except
import Prelude

data MyError = EmptyLine

mightFail :: ExceptT MyError IO ()
mightFail = do
  l <- lift getLine
  when (null l) (throwError EmptyLine)