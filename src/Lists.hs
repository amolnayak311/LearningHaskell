--Lets initialize a list
lostNumbers = [4,8,15,16,23,42]

--Following is not allowed as the types arr of different types
--mixed = [1, 2, 3, 4. 'a', 3]

--Strings are lists, following should set the value True in comparison variable
comparison = "Hello" == ['H', 'e', 'l', 'l', 'o']

--Concat two lists using ++
conList = [1, 2] ++ [3, 4]

-- ++ is not efficient as it iterates the entire list on left irrespective of the list size on right
--The cons operator ':' is more efficient way to prepend an element to a list
cat = 'A' : " Small Cat"

--Selecting an element from an Array using an index
char = cat !! 6    --Gets the 6th character from this List, the index is 0 based

--Following gives an array as there is no element at this position in this list saying index too large
--[1, 2, 3, 4] !! 10

--List can contain Lists
twoDList = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

--Accessing the element from this 2D Lists is as follows
valAt12 = twoDList !! 1 !! 2
--First 1 selects the list [4, 5, 6], the 2 after !! selects element 6

--These 2D lists can have inner lists of different size, but same time
--For e.g, the following List is invalid
--[[1, 2], ['a', 'b']]
--However, the following is a valid example
concatList = twoDList ++ [[10, 11]]

--Lists can be compared using <, >, <= and >= and == the first element is compared with the first of second and compared till
--a different one is found, Try the following examples on ghci
-- [2] > [1, 2, 3]  Gives True, irresective of length as the first element of left side is greater than first of right side
-- [3, 2, 1] > [1, 10, 100]  Gives True, Same as above reasoning
-- [1, 2, 3] == [1, 2, 3] gives True as the two lists are equal


--Look at the ListOps.hs now for some operations on List in Haskell 
