module Ex4 where
import           Prelude

-- 1.
evenLength :: [a] -> Bool
evenLength ns = rem (length ns) 2 == 0

midpoint :: [a] -> Int
midpoint ns = div (length ns) 2

halve :: [a] -> ([a], [a])
halve ns | evenLength ns = (take (midpoint ns) ns, drop (midpoint ns) ns)
         | otherwise     = error "can't halve an odd number of elements"

-- 2

third = head . tail . tail
third2 xs = xs !! 2

third3 :: [a] -> a
third3 (_ : _ : t : _) = t

-- 3

safeTailA xs = if null xs then [] else tail xs


safeTailB :: [a] -> [a]
safeTailB ns | null ns   = []
             | otherwise = tail ns

safeTailC xs = tail xs
safeTailC [] = []

-- 4
disA :: Bool -> Bool -> Bool
False `disA` False = False
_     `disA` _     = True

disB b c | b == c && b = False
         | otherwise   = True

False `disC` False = False
_     `disC` _     = True

-- Last way is just enumerating the truth table, skipping

-- 5
andAlt :: Bool -> Bool -> Bool
-- Don't really understand the question - Ah nvm it means using the if/then/else flow
-- this seems to be a complete definition according ghci?
-- True `andAlt` True = True
-- _    `andAlt` _    = False
-- implementing exhaustive def

andAlt a b = if a then (if b then True else False) else False

-- I guess this dodges usage of standard lib functions? idk

-- 6. implementing pattern matching def/smarter def
andAltB a b = if a then b else False

-- 7. The parenthesis are important - ref the types of inside exprs

mult = \x -> (\y -> (\z -> x * y * z))


-- 8.

luhnDouble :: Int -> Int
luhnDouble n | 2 * n > 9 = 2 * n - 9
             | otherwise = 2 * n

l = luhnDouble
luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d = (l a + b + l c + d) `rem` 10 == 0
