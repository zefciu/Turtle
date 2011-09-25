import Char
import List
import Test.QuickCheck
import Text.Printf
import Turtle.Arcs

prop_inrange :: (Float -> Float -> Float) -> Float -> Float -> Bool
prop_inrange f a b = a' >= 0 && a' <= 360
    where a' = a `f` b

--instance Arbitrary Float where
--    arbitrary n = choose (0, 360) :: Gen Float

main = do
    quickCheck $prop_inrange (addArc)
    quickCheck $prop_inrange (subArc)

