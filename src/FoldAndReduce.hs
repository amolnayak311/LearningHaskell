-- Lets look at something called fold left in haskell

-- Lets implement sum using fold left

sumf :: Num a => [a] -> a
sumf xs = foldl (\acc x -> acc + x) 0 xs

-- Lets see what have we done here
-- The lambda (\acc x -> acc + x) means we have a floating function that accepts two parameters
-- acc and a value x. the parameter acc is an accumulator and the parameter x is an element of the list being
-- given one at a time. The second parameter for foldl is the starting value of the accumulator and the third parameter
-- is the list to to folded. Following sequence of events happen hen we fold a list [1, 2, 3, 4]
-- ((((0 + 1) + 2) + 3) + 4) which becomes 10

-- Lets write even short implementation of sumf as follows

sumf' :: Num a => [a] -> a
sumf' = foldl (+) 0

-- This is same as the previous implementation. The operator + is binary function and we passed it as the parameter
-- The second parameter of foldl is 0 and the last parameter is not applied giving us a partially applied function [a] -> a


-- Lets Implement map using foldr
mapr :: (a -> b) -> [a] -> [b]

mapr f  = foldr (\x acc -> (f x) : acc) [] 


--Lets implement sum using foldl1
sumf1 :: Num a => [a] -> a
sumf1 [] = 0
sumf1 xs = foldl1 (+) xs

-- The base case for empty list is needed as foldl1 expects a non empty list and the
-- head is treated as the base value of the accumulator
-- We similarly have foldr1


-- Lets Implement maximum
maxf :: Ord o => [o] -> o
maxf = foldl1 (\maxn x -> if maxn < x then x else maxn)

-- Lets Implement reverse
-- Implementing reverse can be done easily using foldl

reversef :: [a] -> [a]
reversef = foldl (\acc x -> x : acc) []

-- Lets implement product
productf1 :: Num a => [a] -> a
productf1 = foldl1 (*)

-- Note that this implementation of product function is not tolerant to passing empty list

-- Lets implement filter

filterf :: (a -> Bool) -> [a] -> [a]

filterf f = foldr (\x acc -> if f x then x : acc else acc) []
-- Note that we used foldr instead of  foldl as we want the elements in filtered list in same order as the input list




