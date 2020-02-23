module Ex5 where
import           Prelude

-- 1. sum
total = sum [ x ^ 2 | x <- [1 .. 100] ]

-- 2. grid
grid :: Int -> Int -> [(Int, Int)]
grid x y = [ (a, b) | a <- [0 .. x], b <- [0 .. y] ]

-- 3. square size n
onSquare n (x, y) | x == y                               = False
                  | x == n || y == n || x == 0 || y == 0 = True
                  | otherwise                            = False

square n = filter (onSquare n) (grid n n)

-- 4. reimplement replicate

replicate n a = [ a | _ <- [1 .. n] ]

-- 5. pythag triplets 
pyths :: Int -> [(Int, Int, Int)]
pyths n =
    [ (x, y, z)
    | z <- [1 .. n]
    , y <- [1 .. z]
    , x <- [1 .. z]
    , y ^ 2 + x ^ 2 == z ^ 2
    ]

-- 6. perfect numbers
factors :: Int -> [Int]
factors n = [ x | x <- [1 .. n - 1], n `rem` x == 0 ]

perfects :: Int -> [Int]
perfects n = [ x | x <- [1 .. n], x == (sum . factors) x ]

-- 7. comprehension redef with 1 generator
-- 8. positions
positions :: Eq a => a -> [a] -> [Int]
find k t = [ v | (k', v) <- t, k == k' ]
positions x xs = find x [ (xs !! i, i) | i <- [0 .. length xs - 1] ]

-- 9. scalar product
scalarproduct :: [Int] -> [Int] -> Int
scalarproduct xs ys = sum [ xs !! i * ys !! i | i <- [0 .. length xs - 1] ]
