module Turtle.Arcs where

normalize :: (Ord a, Num a) => a -> a
normalize x | x > 360     = normalize $x - 360
            | x < 0       = normalize $x + 360
            | True        = x

addArc :: (Ord a, Num a) => a -> a -> a
start `addArc` x = normalize (start + x)

subArc :: (Ord a, Num a) => a -> a -> a
start `subArc` x = normalize (start - x)
