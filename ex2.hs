

module Ex2 where
import           Prelude

k :: Int
k = a `div` length xs
  where
    a  = 10
    xs = [1, 2, 3, 4, 5]

last2 = head . reverse

last3 [x     ] = x
last3 (n : ns) = last ns
last3 []       = error "empty list"

init2 = reverse . tail . reverse

init3 ns = take (length ns - 1) ns
