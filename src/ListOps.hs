--In this Haskell code we will look at some of the operations on the haskell lists

-- The Head operation takes the first element of the List

h = head [1, 2, 3, 4] --Should be 1

-- Should be the List except the head
t = tail [1, 2, 3, 4] --  Should be [2, 3, 4]

-- Init takes all the list except the last element
i = init [1, 2, 3, 4] --should be [1, 2, 3]

--Similarly last should give the last element of the List
l = last [1, 2, 3, 4]

--Lets get the length of the String in Haskell
len = length [1, 2, 3, 4, 5]

-- Function to check if the given List is empty of not
isEmpty xs = null xs

--Function that will reverse a list
rev xs = reverse xs

--take and drop takes and drops the specified number of elements from the list
--If the number of elements to take a drop are more than the number of elements
--in the list, no error is thrown, just all the elements are taken or dropped

tk num xs = take num xs

drp num xs = drop num xs

--maximum, minimum, sum and product find the max, min, sum and product of the given list respectively

maxi xs = maximum xs
mini xs = minimum xs
su xs = sum xs
prod xs = product xs


--elem takes and element and tells if this element is part of the list provided
--note that, you can convert a normal method to infix by writing it in `
--eg: exists 2 [1, 2, 3, 4] can be written as 2 `exists` [1, 2, 3, 4] for better readibility
exists e xs = elem e xs

--Lets look at Ranges in Haskell, following will generate the range of numbers 1 to 20, both inclusive
oneToTwenty = [1..20]
--Similar ranges work for characters
aToZ = ['a'..'z']
kToZ = ['K'..'Z']

--To specify the step in the range, you need to specify the first two numbers in the range and the end
--Haskell will find the difference between the first two numbers and give the range, for e.g
allOdd = [1, 3..20] -- This will give all off numbers with max number being 19
--By default the step is 1. Thus [20..1] won't work, instead we need to give first two numbers in the sequence
--To get this step size we need to specify the first two numbers in the range as follows
decreasingSeq = [20, 19 .. 1]

--Lets take first 20 numbers from this infinite list
infiniteList = [1..]
--Note that since this is a lazy evaluation, it will not execiute immediately
--We will execute the following and get first 20 numbers
twentyFromInfinite = take 20 infiniteList
--Cycle and Repeat are used to take a list or a singular value and repeat it indefinitely
--These are to be used with take to restrict the number of elements we take from this infinite stream
oneToFourFiveTimes = take 20 (cycle [1, 2, 3, 4])
three10Times = take 10 (repeat 3)





