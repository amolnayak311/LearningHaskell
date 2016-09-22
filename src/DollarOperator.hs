-- Lets look at what $ operator is in this exercise.

-- If f is a function and x is a parameter f x is same as f $ x
-- However, $ has lowest precedence and thus doesn't force us to use brackets as in following cases

sqrtWithoutDollar = sqrt 4 + 12
sqrtWithDollar = sqrt $ 4 + 12

-- As we see above, without dollar the result is ((sqrt 4) + 12) which gives 14
-- we however expect 4 that is sqrt 16, to achieve this we use the $ operator.
-- This evaluates the value on the right of $ which evaluates to 16 and then finds the sqrt
-- of 16

-- Lets evaluate the following expression using $
exprWithBrackets = sum (filter (> 10) (map (*2) [2..10]))
exprWithDollar =  sum $ filter ( > 10) $ map (*2) [2 ..10]
isExprWithDollarEqWithBracket = exprWithBrackets == exprWithDollar

-- As we see, the $ operator is more convenient than putting brackets all over

-- Finally lets see how to define function composition using . operator
-- Composition of function f and g on x is f(g(x)) or written as f.g x
-- In Haskell the operator . is lets apply the following . operator to 
-- compose negate and abs functions to get a list of negative numbers for the given list

allNegated = map (negate.abs) [1, 2, -3, 4, -5, -6, 7]
