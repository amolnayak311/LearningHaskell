--In this file we will work with Tuples in Haskell
--Lets define a Tuple of two elements
name = ("Chris", 30)

--Accessing the first and second element can be done uwing fst and snd methods
first = fst name
second = snd name

--Tuples can have all elements of different types

--Lets look a function called zip

--First, lets zip two lists of equal size
zipEqual = zip [1..4] [5..8]

--This creates a list of tuples where one to one mapping is done, that is 
--we get a List of tuples having the elements (1, 5), (2, 6), (3, 7), (4, 8)

-- Suppose we have to zip lists of unequal size
zipUnequal1 = zip [1..6] [1..2]
zipUnequal2 = zip [1..2] [10..15]

--In this case no errors are thrown but the result list is of the same size of the smaller list
--as seen in the above two zip

--Lets find all right angle triangles with sides no more than 10 and perimeter is equal to 24
--    /|
-- c / |
--  /  | b
-- /___|
--   a
-- As we can see, no side will be greater than hypotenuse c,  
-- and the remaining two side can be equal
rightTriangles = [(a, b, c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a + b + c == 24]

--We are yet to see how can we access values of any element of a tuple with more than two values
--e.g. ('John', 20, 'Developer'), this is a tuple of three elements we can potentially have a lot more
--values in a tuple, having methods like fst and snd is not practical and there needs to be a generic way

--One detail for fst and snd
--This function can be invoked only on a pair
--thus fst (1, 2, 3) will not give the value 1 however, fst (1, 2) would work

