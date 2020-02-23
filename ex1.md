1. double(double 2) -> double 2 + double 2 -> 2 + 2 + double 2 -> 4 + double 2 -> 4 + (2+2) -> 4+4 -> 8

2. sum [x] = sum [x:[]] = x + sum [] = x + 0 = x
3. ref prod :: Num a => [a] -> a
4. In line 1 of the declaration replace `qsort smaller ++ [x] ++ qsort larger` with `qsort larger ++ [x] + qsort smaller`. This will reverse the order
5. Replacing `<=` by `<` in the list comprehension would output a list of distinct sorted members of the input list.