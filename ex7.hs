module Ex7 where
import           Prelude

--1
comprehension :: [a] -> (a -> Bool) -> (a -> b) -> [b]
comprehension list p f = map f (filter p list)

--2
-- typo in book. type is not (a -> Bool) -> [Bool] -> Bool
all' :: (a -> Bool) -> [a] -> Bool
all' _ []       = True
all' p (b : bs) = p b && all' p bs

any' :: (a -> Bool) -> [a] -> Bool
any' _ []       = False
any' p (b : bs) = p b || any' p bs

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' _ []       = []
takeWhile' p (x : xs) = if p x then x : takeWhile' p xs else []

--3
map' :: (a -> b) -> [a] -> [b]
map' _ [] = []
map' f l  = foldr ((:) . f) [] l

condconcat :: (a -> Bool) -> a -> [a] -> [a]
condconcat p x l | p x       = x : l
                 | otherwise = l

filter' :: (a -> Bool) -> [a] -> [a]

filter' _ [] = []
filter' p l  = foldr (condconcat p) [] l

--4 

dec2int :: [Int] -> Int

-- more appropriately called logceil10 or count0sin
log10 :: Int -> Int
log10 n | n >= 10         = 1 + log10 (n `quot` 10)
        | n < 10 && n > 0 = 1
        | n == 0          = 0

(*+) :: Int -> Int -> Int
b *+ a = a + (10 ^ log10 a) * b

dec2int [] = 0
dec2int l  = foldl (*+) 0 l

curry' :: ((a, b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y