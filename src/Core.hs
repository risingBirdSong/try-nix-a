module Core where

import Control.Monad.Except
import Prelude

data MyError = EmptyLine

coremain :: ExceptT MyError IO ()
coremain = do
  l <- lift getLine
  when (null l) (throwError EmptyLine)