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
-- ghci> :t (==)
-- (==) :: Eq a => a -> a -> Bool
-- ghci> :t (/=)
-- (/=) :: Eq a => a -> a -> Bool
-- ghci> :t (*)
-- (*) :: Num a => a -> a -> a

-- The type of == states that this function accepts two parameters of type a and returns a boolean value
-- The portion before => is the constraint, in case of == and /= the constraint is that the 
-- values on which we invoke == should be a member of Eq, its an interface for testing the Equality in haskell
-- Some Type clases in Haskell
--
-- Ord: members that can be ordered, compared
-- Eq: Members that can be equated using ==
-- Show: Members that can be converted to a String
-- Read: Members that can be parsed from a String back to a type
--
-- E.g Read "True" gives a boolean variable True
-- Try the following 
-- ghci> read "True" || False
-- True
-- ghci> read "True"
-- *** Exception: Prelude.read: no parse
-- As we can see, the First case worked as the language knows || Expects a boolean
-- thus read tries to convert the String passed to read to a boolean which works
-- Where as the second fails as we cont possibly know the type to convert the String into
-- Similarly 
-- ghci> read "qwery" || False
-- Doesnt work too
-- 
-- Enum: Sequential ordered types, e.g [1..5], ['A' .. 'Z']
-- Note that [1, 2, 3, 4, 5] is not an Enum even though it seems same as [1..5]
-- Try calling :t on both [1..5] and [1, 2, 3, 4, 5]
--
-- Bounded: These types have Bounded values, e.g
-- ghci> minBound :: Int
-- 9223372036854775808
-- ghci> maxBound :: Int
-- 9223372036854775807
--
-- Num: Numeric Typeclass which can act as numbers
-- Integral: All numeric sub types, Int and Integer type classes fall in this type
-- Floating: All floating types like Float and Double