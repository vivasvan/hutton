module Ex6 where
import           Prelude

--1
fac2 n | n > 0  = n * fac2 (n - 1)
       | n == 0 = 1
       | n < 0  = error ("invalid arg")

--2
sumdown n | n > 0  = n + sumdown (n - 1)
          | n == 0 = 0
          | n < 0  = error ("invalid arg")

--3
(^-) :: Int -> Int -> Int
(^-) _ 0 = 1
(^-) a b = a * (^-) a (b - 1)

--4 
euclid m n | m < 0 || n < 0 = error ("arguments must be non-neg integers")
           | m < n          = euclid n m
           | m == n         = n
           | m > n          = euclid n (m - n)

--5 todo

--6 
--a
and' :: [Bool] -> Bool
and' []       = True
and' (b : bs) = b && and' bs

--b
concat' :: [[a]] -> [a]
concat' []       = []
concat' (l : ls) = l ++ concat' ls

--c
replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate' (n - 1) x

--d

(!!+) :: [a] -> Int -> a
(!!+) (a : as) i | i == 0    = a
                 | otherwise = as !!+ (i - 1)

(!!+) [] _ = error "index out of range"


--e

elem' :: Eq a => a -> [a] -> Bool
elem' _  []       = False
elem' x' (x : xs) = x' == x || elem' x' xs

--7
-- PRESERVES ORDER
merge' :: Ord a => [a] -> [a] -> [a]
-- remember the argument lists are both sorted themselves! you just have to preserve order
merge' xs [] = xs
merge' [] ys = ys
merge' (x : xs) (y : ys)
    | x <= y    = x : merge' xs (y : ys)
    | x > y     = y : merge' (x : xs) ys
    | otherwise = error "something went wrong - bad arguments?"

--8
midpoint :: [a] -> Int
midpoint ns = div (length ns) 2

halve :: [a] -> ([a], [a])
halve ns = (take (midpoint ns) ns, drop (midpoint ns) ns)

msort :: Ord a => [a] -> [a]
msort [n] = [n]
msort []  = []
msort ns =
    merge' (msort (take (midpoint ns) ns)) (msort (drop (midpoint ns) ns))


--9
--a
sum' :: Num a => [a] -> a
sum' []       = 0
sum' (n : ns) = n + sum' ns

--b
take' :: [a] -> Int -> [a]
take' [] _ = error "can't take from empty list"
take' _  0 = []
take' (a : as) i | null as && i > 0  = error "can't take from empty list"
                 | null as && i == 1 = [a]
                 | otherwise         = a : take' as (i - 1)


last' :: [a] -> a
last' []       = error "list is empty"
last' [l     ] = l
last' (_ : xs) = last' xs
