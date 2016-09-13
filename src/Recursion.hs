-- Lets look at recursion in some details now

-- Lets use recursion to find maximum of a number

maximum' :: Ord a => [a] -> a

maximum' [] = error "Trying to find maximum of an empty list"

maximum'[x] = x

maximum' (x:xs) 
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum' xs
    
-- Lets implement take function using recursion
-- Chech out how we mentioned below that i is both a Num and an Ord
take' :: (Num i, Ord i) => i -> [a] -> [a]

take' _ [] = [] 
take' n (x:xs)
    | n <= 0 = []
    | otherwise = x : take' (n - 1) xs
  
-- ghci> take' 10 []
-- []
-- ghci> take' 5 [1, 2, 3, 4]
-- [1,2,3,4]
-- ghci> take' 2 [1, 2, 3, 4]
-- [1,2]
-- ghci> take' (-2) [1, 2, 3, 4]
-- []

-- Lets now reverse the List using recursion

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- ghci> reverse' []
-- []
-- ghci> reverse' [1, 2, 3]
-- [3,2,1]

-- Lets now zip two lists together


zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

-- ghci> zip' [] []
-- []
-- ghci> zip' [] [1, 2, 3]
-- []
-- ghci> zip' [1, 2, 3] []
-- []
-- ghci> zip' [1, 2, 3] [2, 3]
-- [(1,2),(2,3)]
-- ghci> zip' [1, 2] [1, 2, 3]
-- [(1,1),(2,2)]

-- Lets now implement quicksort in haskell

quicksort :: Ord i => [i] -> [i]
quicksort [] = []
quicksort (x:xs) = 
    let smallerSorted = quicksort [s | s <- xs, s <= x]
        largerSorted = quicksort [l | l <- xs, l > x]
    in
        smallerSorted ++ [x] ++ largerSorted

-- ghci> quicksort [10, 3, 4, 2, 6, 7, 8]
-- [2,3,4,6,7,8,10]
-- ghci> quicksort "the quick brown fox jumps over the lazy dog"
-- "        abcdeeefghhijklmnoooopqrrsttuuvwxyz"
