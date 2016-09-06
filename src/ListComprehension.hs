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