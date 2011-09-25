module Turtle.Arcs where

normalize :: (Ord a, Num a) => a -> a
normalize x | x > 360     = normalize $x - 360
            | x < 0       = normalize $x + 360
            | True        = x

(+>) :: (Ord a, Num a) => a -> a -> a
start +> x = normalize (start + x)

(<+) :: (Ord a, Num a) => a -> a -> a
start <+ x = normalize (start - x)
