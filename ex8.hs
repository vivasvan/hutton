module Ex8 where
import           Prelude
import           Data.Tree
import           Ex6

-- 1. 
mult :: Int -> Int -> Int
mult 0 _ = 0
mult a b = a + mult (a - 1) b

-- 2, 
isEqual :: Ord a => a -> a -> Bool
isEqual m n = EQ == compare m n


occurs :: Ord a => a -> Tree a -> Bool
occurs x = foldTree (\o os -> or (isEqual o x : os))

-- 3. 
data BinaryTree a = Leaf a |  BinaryTreeNode a (BinaryTree a) (BinaryTree a)

leafCount :: BinaryTree a -> Int
leafCount (Leaf _              ) = 1
leafCount (BinaryTreeNode _ a b) = leafCount a + leafCount b

balanced :: BinaryTree a -> Bool
balanced (Leaf _              ) = True
balanced (BinaryTreeNode _ a b) = abs (leafCount a - leafCount b) <= 1

--4 
balance :: [a] -> BinaryTree a
balance [x     ] = Leaf x
balance (t : ts) = do
    let (m, n) = halve ts
    BinaryTreeNode t (balance m) (balance n)
balance [] = error "empty input array"


