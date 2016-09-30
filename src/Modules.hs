-- In this Section we will look at the concept called modules
-- Import a module as follows

import Data.List as L
import Data.Char as C
--import Data.Map as M

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


-- Drop while is opposite of TakeWhile, we drop all the elements till it encounters a first false.
-- Everything after the first false is encountered will be returned
dropWhileString = dropWhile (/= ' ') "Hello World"

-- Span is something similar
(pre, post) = span (/= ' ') "Hello World"
-- pre will contain all the chars when the given condition was true, post will contain everything else

groupUnsorted = group [1, 2, 3, 4, 5, 1, 3, 4]

groupSorted = group $ sort [1, 2, 3, 4, 5, 1, 3, 4]

-- ghci>groupUnsorted 
-- [[1],[2],[3],[4],[5],[1],[3],[4]]
-- ghci>groupSorted 
-- [[1,1],[2],[3,3],[4,4],[5]]

-- As we see above, group works on sorted data only, it produces 
-- unexpected output for unsorted data

-- inits and tails gives the possible inits and tails of a list recursively
zipInitsAndTails = zip (inits w) (tails w) where w = "Hello"


-- isPrefixOf and isSuffix of as expected will check for prefix and suffix of a list

isHelloPrefix = "Hello" `isPrefixOf` "Hello World"      --True
isHelloPrefix1 = "Hello" `isPrefixOf` "Hey! Hello"      --False
isThereSuffix = "There" `isSuffixOf` "Hello There"      --True
isThereSuffix1 = "There" `isSuffixOf` "Hello There!"    --False


-- Partition splits the list in those that match and those that dont match a condition

partitionOddsAndEven = partition (\x -> (mod x 2) == 0) [1 .. 10]
-- ghci>partitionOddsAndEven 
-- ([2,4,6,8,10],[1,3,5,7,9])


intList = [1 .. 10]


-- Finds the first matching element in the List. Returns a Maybe, which is Just something or Nothing
gt5 = find (>5) intList     -- Should  be Just 6, the first matching element
gt10 = find (>10) intList   -- Should be Nothing, as nothing matches

-- elemIndex is like elem but it returns the index of the elem matched, its typs is again a Maybe

oneElemIndex = 1 `elemIndex` [1 .. 10]
elevenElemIndex = 11 `elemIndex` [1..10]

-- Similarly multiple matches will return a List of indices

oneIndices = 1 `elemIndices` [1, 1, 2, 3, 1, 4, 5]
elevenIndices = 11 `elemIndices` [1, 1, 2, 3, 1, 4, 5]

-- findIndex and findIndices is similar to find except that it finds the index/returns array of index

indexOfO = findIndex ( == 'o') "Hello World"
indexOfA = findIndex ( == 'A') "Hello World"
indicesOfO = findIndices ( == 'o') "Hello World"

-- lines and unlines take lines read from a source and splits the contents in lines or array into a string with \n
linesSplit = lines "Hello\nWorld"
unLines = unlines linesSplit

--Similarly, words and unwords split the sentence into words
wordsInSentence = words "These   are    words in the sentence."
unwordsInSentence  = unwords wordsInSentence

-- delete deletes the given element from the list

fourDeletedList = delete 4  [1..10]

-- Similarly \\ removes the elements on the right from the list on the left

twoToFiveDeleted = [1..10] \\ [2..5]


-- union of a list acts as finding the union of two given lists
aUnionB = "Hey Man" `union` "Man what's up?" 

-- intersect finds the common elements between the two lists
aIntB = [1..5] `intersect` [3..7]

-- insert inserts the element at a position where its value is greater then the element on its left
-- and less than or equal to the element on its right
fourInserted = insert 4 [1, 2, 3, 4, 5]


-- Lets look at some examples of Data.Char package
-- Note that all imports have to done in the beginning and anywhere in the file
-- Note how we can have alias for an import to avoid name conflicts

-- Lets check for space, digit and Alphabet

areSpaceChars = map (\x -> (x, C.isSpace x))  [' ', '\n', '\t', '1']
areNumbericChars = map (\x -> (x, C.isDigit x)) ['1', '2', 'a']
areAlphabeticChars = map (\x -> (x, C.isAlpha x)) ['1', '2', 'a', 'A']

-- Similar to above there are methods for isUpper, isLower, isHexDigit, isOctDigit
-- isAlphaNum, isPunctuation, isSymbol and many more

-- Lets implement a small function giving word count in the given text

toLower' :: [Char] -> [Char]
toLower' word = map toLower word

wordCount :: [Char] -> [([Char], Int)]
wordCount sentence = map (\x -> (head x, length x))$ group $ sort $ map toLower' $ words sentence

-- Lets look at the Data.Map package

-- Lets first implement represent a Map as a List of tuples

mapList = [("One", 1), ("Two", 2), ("Three", 3)]

-- Naive findKey

findKey' :: Eq a => a -> [(a, b)] -> Maybe b
findKey' _ [] = Nothing
findKey' key ((k, v) : t) = if k == key then Just v else findKey' key t









 
