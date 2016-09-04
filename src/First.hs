--cd to the directory containing this file and execute :l First
--Then invoke the following functions from the shell

-- Add Two numbers
addTwo x y = x + y

-- Find the successor of a given parameter x, works numbers and alphabets. Tru nxt 'z' and figure out how the succ works
nxt x = succ x

-- Check if the two params are equal, the function is not paraneter type dependent works for all types comparable
--using ==
eq x y = x == y

--Not equal for given two parameters
-- Can be not (eq x y)
neq x y = x/= y

--Finds minimum of two values given, works for chars as well, try mixing two types as well, char and num wont work, but 
--int and float is an interesting result give the smaller value of the two as an integer and see the type of returned value
mini x y = min x y

--Finds maximum of two given values
maxi x y = max x y



