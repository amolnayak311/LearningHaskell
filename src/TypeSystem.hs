-- In this file we will see type system of Haskell
-- Following import is needed
import Data.Typeable

-- The type of this value is character array, [Char]
str = "Hello World"
typeOfStr = typeOf str

charValue = 'c'
typeOfChar = typeOf charValue

-- From ghci we do the following
-- :t "Hello"
-- "Hello" :: [Char]
-- Following expression 
-- :t 1 + 3
-- 1 + 3 :: Num a => a
-- As we see, the expression 1 + 3 is not evaluated to 4 and the type given out, but
-- gives the entire expression and the type
-- Now try to see what is the type of
-- :t 1 + 3.0

testTuple = ('a', 'b', 'c')
typeOfTuple = typeOf testTuple

-- Lets declare functions now with explicit types
 
-- First the filter method to filter out all chars except upper case chars

removeNonUpperCase :: String -> String
removeNonUpperCase inpStr = [c | c <- inpStr, c `elem` ['A'..'Z']]

-- Following function is needed to add three numbers
addThree :: Int -> Int -> Int -> Int
addThree x y z = x + y + z

-- Type Int -> Int -> Int -> Int indicates that the function takes 3 Int arguments and returns one Int
-- The last parameter is the return type

-- Type Integer is same as BigInteger
factorial :: Integer -> Integer
factorial num = product [1 .. num]

-- If we do not define the type declaration, then, the type of the function is
-- factorial :: (Enum a, Num a) => a -> a
-- This too gives a correct value for factorial 50 as the return type is Integer
-- Defining the type explicitly as Int as follows gives incorrect results for large results
-- Try calling the function factorial' with the parameter 50, we will get wrong value

factorial' :: Int -> Int
factorial' n = product [1 .. n]

-- Prefer using the type Int over Integer when are absolutely sure that the value will not overflow from
-- 32 bit number as it is much efficient than using Integer

-- Lets look at Float and Double data types
-- pi is defined
circumferencef :: Float -> Float
circumferencef r = 2 * pi * r

circumferenced :: Double -> Double
circumferenced r = 2 * pi * r

-- Type of fst, snd, head and tail of the list are as follows
-- ghci> :t fst
-- fst :: (a, b) -> a
-- ghci> :t snd
-- snd :: (a, b) -> b
-- ghci> :t head
-- head :: [a] -> a
-- ghci> :t tail
-- tail :: [a] -> [a]

-- Lets look at the following