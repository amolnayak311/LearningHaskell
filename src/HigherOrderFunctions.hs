-- All functions in Haskell with more than one parameter are curried

-- a -> a ->a  is same as a -> (a -> a), which means, after applying the first parameter
-- The residual is a function that takes one num as input and returns a num as output

--E.g

addTwoNums :: (Num a) => a -> a -> a
addTwoNums a b = a + b

-- Lets define a partial function, add to two as follows
addTwo = addTwoNums 2

-- Now the following should give 5

twoPlusThree = addTwo 3

-- Lets look at partially applied functions for arithmatic infix operations

dividedBy3 = ( / 3)
multipliedBy3 = (3 * )



-- As in above cases, the infix operator / and * is doesnt have one of the operands to it
--Skipping it returns a partial function which accepts a parameter and uses it in place of the
--missing parameter, the missing parameter can be either of the two operands

--Rules for subtract are slightly different, we can have the following two possiblities

subtract3And = (3 - )
-- The following however doesnt work as it is treated as -3

-- subtract3From = (- 3)
-- Instead we write
subtract3From = (subtract 3)

-- Lets now write a function that acceps a function and applies it twice

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f(f x)

-- To test this, we do the following
-- ghci> applyTwice (2 *) 2
-- 8
-- Which shows that indeed the function double the numbner by two was applied twice.

-- Lets write a function zipWith' which acceps a function and acceps a function and applies it 
-- on two input lists to yield an output list

zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

-- ghci> zipWith' max [1, 2, 3, 4] [4, 3, 2, 1]
-- [4,3,3,4]
-- ghci> zipWith' (+) [1, 2, 3, 4] [4, 5, 6, 7]
-- [5,7,9,11]

-- As we see above, the function is applied to each and every element of the lists and yields
-- one output

-- Lets look at filter and map methods
-- map takes a function and applies the function to each and every element
-- of the given sequence yielding a new sequence
-- Similarly filter takes a function that returns a boolean condition
-- if the Function evaluates to true, we yield that output else we cointinue
-- with subsequent elements in the list
-- Lets implement these functions ourself

map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f (x:xs) = (f x) : map' f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' f (x:xs)
    |  f x          = x : filter' f xs
    |  otherwise    = filter' f xs

-- ghci> filter' ( > 3) [1, 2, 3, 4, 5, 6, 7, 8]
-- [4,5,6,7,8]
-- ghci> map' (+ 3) [1, 2, 3, 4]
-- [4,5,6,7]

