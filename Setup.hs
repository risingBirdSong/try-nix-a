import Control.Monad.Except
import Prelude
import Distribution.Simple

data MyError = EmptyLine

coremain :: ExceptT MyError IO ()
coremain = do
  l <- lift getLine
  when (null l) (throwError EmptyLine)

main = do 
   what <- runExceptT $ coremain
   print "testing"