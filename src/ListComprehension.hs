--In this short Script lets look at an interesting concept called List Comprehension

--Lets express the equation y = 2 * x for x from 1 to 10 
y1 = [2 * x | x <- [1..10]]

--This was simple, now lets define the equation y = 2 * xfor all x between 1 to 10 if x is odd
y2 = [2 * x | x <- [1..10], odd x]

-- Lets define a function y = 2 * x for x = 1 ..20 for x not odd and x not a multiple of 5
y3 = [2 * x | x <- [1..20], not (odd x), not (x `mod` 5 == 0)]

--Lets define a function operating on two Lists
--Equation is z = x * y for each combination of x = [1..4] and y = [1..3]
z1 = [x * y | x <- [1..4], y <- [1, 2, 3]]
--The multiplication goes for each element of the first list, all elements of second are multiplied
--before the second element from the first list is picked

--Lets define our own length function
length' xs = sum [1 | _ <- xs]
--The _ is line ignoring the value

--Lets define our hard coded filter function while will filter out Uppercase 
filterUpperCase xs = [x | x <- xs, x `elem` ['A'..'Z']]

--Later when we learn Anonymous functions in Haskell, we will implement our own 
--filter and map functions

--lets look at iterating through nested lists
--Note how we have nested [], this will yield a list of lists
xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]] 
nxs = [[x | x <- xs, even x ] | xs <- xxs]
--Now, if we see the above result, we get [[2,2,4],[2,4,6,8],[2,4,2,6,2,6]]
-- Lets see how can we get a flattened version of the above list
nxsFlat = [x | xs <- xxs, x <- xs, even x]
-- The value used in the generator(Right Term??) in the list comprehension is evaluated from left to right
--to have the value xs, we need to have it resolve to a variable on the left side whereever its is used
-- That is, having x <- xs, xs <- xxs, will give an error as xs is not yet defined, we need to have it 
-- as  xs <- xxs, x <- xs