-- BMI Result

-- Simple BMI Calculator which tells our BMI based on the given BMI
bmiTell :: (RealFloat f) => f -> String

bmiTell bmi
    |   bmi <= 18.5 = "You are underweight"
    |   bmi <= 25.0 = "You are Normal"
    |   bmi <= 30 = "You are fat"
    |   otherwise = "You are a Whale.."
    
    
--Simple Max function which returns max of two numbers using guards

max' :: Ord a => a -> a -> a

max' a b
    |   a < b = b
    |   otherwise = a
    
-- Let us now calculate BMI using weight and Height in meters

bmiWithHAndW height weight
    |   height / weight ^ 2 <= 18.5 =  "You are Skinny"
    |   height / weight ^ 2 <= 25.0 =  "You are Normal"
    |   height / weight ^ 2 <= 30.0 =  "You are fat"
    |   otherwise = "You are a Whale.."
    
-- A Problem here is that we have repeated height / weight ^ 2 and we have hard coded the values
-- 18.5 25.0 and 30.0
-- Lets fix this problem by adding a where as follows

bmiWithHAndW' height weight
    |   bmi <= skinny =  "You are Skinny"
    |   bmi <= normal =  "You are Normal"
    |   bmi <= fat =  "You are fat"
    |   otherwise = "You are a Whale.."
    where   bmi = height / weight ^ 2
            skinny = 18.5
            normal = 25.0
            fat = 30.0
            
-- Where is not used only for guards but can also be used as follows
-- Following is an example to find the first and last character of a name
-- Note that the indentations is important
initials :: String -> String -> String
initials firstname lastname = [f] ++ ". " ++ [l] ++ "."  
    where   (f:_) = firstname
            (l:_) = lastname
            

                                



