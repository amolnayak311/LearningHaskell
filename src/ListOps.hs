--In this Haskell code we will look at some of the operations on the haskell lists

-- The Head operation takes the first element of the List

h = head [1, 2, 3, 4] --Should be 1

-- Should be the List except the head
t = tail [1, 2, 3, 4] --  Should be [2, 3, 4]

-- Init takes all the list except the last element
i = init [1, 2, 3, 4] --should be [1, 2, 3]

--Similarly last should give the last element of the List
l = last [1, 2, 3, 4]

