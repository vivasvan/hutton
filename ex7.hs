module Ex7 where
import           Prelude
import           Data.Char

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

-- 5
curry' :: ((a, b) -> c) -> a -> b -> c
curry' f x y = f (x, y)

uncurry' :: (a -> b -> c) -> (a, b) -> c
uncurry' f (x, y) = f x y
--6

unfold :: (t -> Bool) -> (t -> a) -> (t -> t) -> t -> [a]
unfold p h t x | p x       = []
               | otherwise = h x : unfold p h t (t x)

type Bit = Int

chop8 :: [Bit] -> [[Bit]]
chop8 = unfold (== []) (take 8) (drop 8)

map'' :: (a -> b) -> [a] -> [b]
map'' f = unfold null (f . head) (drop 1)

never :: a -> Bool
never = const False

iterate' :: (a -> a) -> a -> [a]
iterate' = unfold (const False) id


--9 



altMap :: (a -> b) -> (a -> b) -> [a] -> [b]
altMap f g (x : xs) = f x : (altMap g f xs)
altMap _ _ []       = []

-- 10

luhnDouble :: Int -> Int
luhnDouble n | 2 * n > 9 = 2 * n - 9
             | otherwise = 2 * n


l = luhnDouble
luhn :: [Int] -> Bool
luhn ls = sum (altMap l id ls) `rem` 10 == 0
