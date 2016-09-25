-- In this Section we will look at the concept called modules
-- Import a module as follows

import Data.List
-- Similarly some limited functions can be imported as
-- import Data.List (nub, sort)
-- import multiple packages as follwos
-- import Data.List Data.Map Data.Set
-- import all except a function as follows
-- import Data.List hiding (nub)

-- Lets get unique elements of a given array as follows
uniqueElements :: Eq a => [a] -> [a]
uniqueElements xs = nub xs

-- Lets look at intersperse function of this Data.List
interspersedString = intersperse '.' "String"

-- intercalate deals with list, puts in the given list between the list elements provided and  flattens it
intercalatedString  = intercalate " " ["Hello", "World"]

intercalatedInts  = intercalate [0] [[1], [2]]

-- notice how we have Lists within a List as second parameter and the first parameter is a list in itself
-- The type of all these elements need to be same

-- Lets look at something called transpose
-- Lets transpose this matrix (2d list) as follows

transposedMatrix = transpose [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

-- Strict version of foldl and foldr
-- Default foldl and foldr will not compute the accumulated values on iteration and will try to resolve it 
-- lazily. This might cause stack overflow on large lists. To avoid this stack overflow, use the strict
-- versions foldl' and foldr'
-- Lets look at foldl' to compute the sum of a small list, 

sumFoldl' = foldl' (+) 0 [1, 2, 3, 4, 5]

-- concat, flattens multiple lists into one list

concatStrings = concat ["Hello", " ", "World"]
concatNumbers = concat [[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12]]

-- Lets look at concatMap. concatMap is same as applying a function to each element of the list
-- to give a list output and then flattening the output
-- the type of this concatMap has the following signature
-- concatMap :: (a -> [b]) -> [a] -> [b]

concatMapRes = concatMap (\x -> [(x + 1)]) [1, 2, 3, 4]

-- Lets implement our own concatMap implementation
-- using map and concat functions

concatMap' :: (a -> [b]) -> [a] -> [b]
concatMap' f xs = concat $ map f xs
concatMapRes' = concatMap' (\x -> [(x + 1)]) [1, 2, 3, 4]

-- and function returns true only of all the values of the list satisfy the given function

andCondition = and $ map (> 4) [5 .. 9]

orCondition = or $ map (> 4) [1 .. 6]

-- Similarly any or all also are used to see if the given condition matches the given predicate
-- it is generally preferred over and / or

allMatch = all (`elem` ['A'..'Z']) "HeyGuyswhatsup"
anyMatch = any (`elem` ['A'..'Z']) "HeyGuyswhatsup"

-- Iterate takes a starting value and a bivariate function to which it applies
-- the function repeatedly. Note that iterate generates an infinite list and thus
-- we nee to restrict the size using take or takeWhile

iterateListTake10 = take 10 $ iterate (subtract 2) 1
-- similarly using takeWhile to get the prefix of the list that is  < 20
iterateListTakeWhileGtMinus30 = takeWhile (<20) $ iterate (+1) 1

-- Lets look at splitAt function. This will split the given list at the given 
-- index (0 based) and returns a tuple of two lists

-- Splitting at 0 gets 0 elements in first split and remaining in second
splitAt0 = splitAt 0 [1, 2, 3, 4]

-- Splitting at 3 takes 3 elements in first split and remaining in second
splitAt3 = splitAt 3 [1, 2, 3, 4, 5, 6]

-- Splitting at negative, doesnt throw any exception and takes no elements in left split
-- and all elements in right split
splitAtNegative = splitAt (-1) [1, 2, 3, 4, 5]

-- Similarly giving a huge number more than list size doesnt throw any exception but 
-- puts all the elements in the left split and nothing in the right split
splitAtAboveRange = splitAt 100 [1, 2, 3, 4, 5]


 
