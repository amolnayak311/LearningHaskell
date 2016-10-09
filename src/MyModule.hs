module MyNumOps (
    numadd,
    numprod,
    numsub
)
where

numadd :: Num x => [x] -> x
numadd xs = foldl (+) 0  xs

numprod :: Num x => [x] -> x
numprod xs = foldl (*) 1 xs

numsub :: Num x => [x] -> x
numsub [] = 0
numsub xs = foldl1 (-) xs