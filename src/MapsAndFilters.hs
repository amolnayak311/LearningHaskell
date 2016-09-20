-- Here we will See how the map, filter and takeWhile works in haskell

-- Lets map a list of input values of x and give the resulting output 2x + 1 for each of them

x = [1, 2, 3, 4, 5]
f x = 2 * x + 1
y = map f x

-- Above way is a verbose in the way of defining a function and then passing it
-- It can be simplified by using lambdas as follows

yl = map (\x1 -> 2 * x1 + 1) x

-- As we see in the above line, we defined the function in line which accepts one parameter and 
-- the body is the result of the expression 2 * x + 1
-- The paramater begins with a \ followed by the name of the variable which can be any valid variable name

-- Similarly lets define a filter function which from a list of numbers from 1 to 20 will filter multiples of 3

inall = [1..20]

multOf3 = filter (\x -> (mod x 3) == 0) inall

-- Again we used lambdas
-- Speaking of lambdas, we have not defined a lambda with more than one parameter
-- Lets function that uses zipWith and add the two numbers in the corresponding list in
-- the input list

addedZip = zipWith (\x y -> x + y) [1..4] [5..8]

-- Lets look at takeWhile. This is an important function when dealing with infinite sequences
-- Or Job is to find sum of all odd squares of numbers less than 10000 
-- Following one line does the job
-- Notice the beauty of the lazy evaluating. The takeWhile condition is higher up the stack, yet, 
-- the infinite sequence [1..] works perfectly fine even though its mapped, filtered and then given to the takeWhile

sumOfAllBounddOddSquares = sum(takeWhile (< 10000) (filter odd (map (^ 2) [1..])))

