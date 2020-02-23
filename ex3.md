1. Types of expresions:
   - ['a','b','c'] :: [Char]
   - ('a,b'c') :: (Char, Char, Char)
   - [(False, '0'), (True, '1')] :: [(Bool, Char)]
   - ([False, True], ('0','1')) :: ([Bool], [Char])
   - [tail, init, reverse] :: [[a] -> [a]]

2. Examples of prescribed types 
   - `bools: [Bool]` / `[True]`
   - `nums :: [[Int]]` / `[[1,2], [3,4]]`
   - `add :: Int -> Int -> Int -> Int` / `add w x y z = w + x + y + z`
   - `copy :: a -> (a,a)` / `copy x = (x, x)`
   - `apply :: (a -> b) -> a -> b` / `apply f x = f x`

3. Types of functions:
   - if `second xs = head (tail xs)` then `:type second` is `[a] -> a`
   - if `swap (x,y) = (y,x)` then `:type swap` is `(a,b) -> (b,a)`
   - if `pair x y = (x,y)` then `:type pair` is `a -> b -> (a,b)`
   - if `double x = x * 2` then `:type double` is `Num a => a -> a`
   - if `palindrome xs = reverse xs == xs` then `:type palindrome` is `Eq a => [a] -> Bool` (nb only equatable a is required, no other restrictions - order is index based)
   - if `twice f x = f (f x)` then `:type twice` is `a -> a -> a -> a`. Correction - according to ghci the type is actually `(a->a) -> a -> a`. It makes sense intuitively, twice is not curriable in the sense that you can just 3 values of type `a` and output an a. Todo find a better way to explain this.
5. Function types cannot generally be instances of Eq as function equivalence is logically equivalent to the halting problem