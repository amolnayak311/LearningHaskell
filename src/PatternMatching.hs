-- In this file we will look at pattern matching samples

-- Lets define a lucky 7 implementation
-- First the type definition of Function

lucky :: Integral a => a -> String
lucky 7 = "LUCKY NUMBER SEVEN"
lucky x = "Sorry, try again"

-- Lets similarly compute the factorial of a number

factorial :: Integral a => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- Another one to print the Text version of a number between 1 to 5, else  print a default message

printMe :: Integral a => a -> String
printMe 1 = "One"
printMe 2 = "Two"
printMe 3 = "Three"
printMe 4 = "Four"
printMe 5 = "Five"
printMe x = "Error, can print only for numbers in range 1 .. 5"

-- Incomplete pattern match
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"

nameWithA = charName 'a'
nameWithB = charName 'b'
-- nameWithH = charName 'h'
-- ghci> charName 'h'
-- *** Exception: PatternMatching.hs:(28,1)-(29,24): Non-exhaustive patterns in function charName

-- As seen above if pattern match is not exhaustive, we will get an error for not having a matching pattern

-- Lets see two versions of addVectors, the second one is more convenient than first one
-- as it matches the patterns

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)
addVectors a b = (fst a + fst b, snd a + snd b)

addVectors' (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- Lets implement a method for triple simiar to fst and snd for pair

first (x, _, _) = x
second (_, y, _) = y
third (_, _, z) = z

-- The first, second and third method similar to fst and snd for pair
f = first (1, 2, 3)
s = second (1, 2, 3)
t = third (1, 2, 3)

-- Pattern Match for List of Tuples in List comprehension

xss = [(1, 2), (3, 4), (5, 6), (7, 8)]
xs = [x + y | (x, y) <- xss]

-- Lets implement our own version of head
--head' [] = error "Cannot call head' on empty list"
-- ghci> head' []
-- *** Exception: Cannot call head' on empty list


head' :: [a] -> a
head' (x:_) = x

-- Lets implement the sum, length and tell function using pattern matching


length' :: (Num b) => [a] -> b
length' [] = 0
length' (_:xs) = 1 + length' xs


sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' (x:xs) = x + sum' xs

tell :: (Show a) => [a] -> String
tell [] = "List is empty"
tell (x:[]) = "List has One element " ++ show x
tell (x:y:[]) = "List has two elements, first element is " ++ show x ++ " and second element is  " ++ show y
tell (x:y:_) = "List has many elements, first one is " ++ show x ++ ", second element is " ++ show y

-- ghci> tell []
-- "List is empty"
-- ghci> tell [1]
-- "List has One element 1"
-- ghci> tell [1, 2]
-- "List has two elements, first element is 1 and second element is  2"
-- ghci> tell [1, 2, 3]
-- "List has many elements, first one is 1, second element is 2"

-- Lets write a different way of pattern match, in this approach we capture the entire input and also
-- matched patterns

firstLetter :: String -> String
firstLetter "" = "Given String is empty"
firstLetter allStr@(f:xs) = "First Character of input string " ++ allStr ++ " is " ++ [f]
-- ghci> firstLetter ""
-- "Given String is empty"
-- ghci> firstLetter "Hello"
-- "First Character of input string Hello is H"