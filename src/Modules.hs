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

