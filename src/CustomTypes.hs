-- Lets define a Type called Shape and let it be some shapes as given below
data Shape = Circle Float Float Float | Rectangle Float Float Float Float
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
surface (Rectangle x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- Try printing out Circle 1 2 3 on the shell and we should get an error
-- Lets fix this by having another implementation showing how to fix this problem by adding deriving (Show) at the end of type declaration

data Shape' = Circle' Float Float Float | Rectangle' Float Float Float Float deriving (Show)
surface' :: Shape' -> Float
surface' (Circle' _ _ r) = pi * r ^ 2
surface' (Rectangle' x1 y1 x2 y2) = (abs $ x2 - x1) * (abs $ y2 - y1)

-- Now try Circle' 1 2 3

-- Lets look at an alternative and more intuitive way to create a type, lets create a type Car

data Car = Car {company :: String, model :: String, year :: Int} deriving Show

-- This not only defines the Car but also gives us the handy methods to view the details of the car

c = Car "Ford" "Mustang" 2016
carModel =  model c -- Should be Mustang
carCompany =  company c -- Should be Ford
carYear = year c    -- Should be 2016

-- Lets write a neat function to define the car

tellCar :: Car -> String

tellCar (Car {company = c, model = m, year = y}) = "This car is a " ++ c ++ " " ++ m ++ " built in " ++ show y




