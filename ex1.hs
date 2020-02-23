import           Prelude
import           Ex2

prod :: Num a => [a] -> a
prod []       = 1
prod (n : ns) = n * prod ns

main :: IO ()
main = do
    let x = prod [2, 3, 4]
    (putStrLn . show) x
