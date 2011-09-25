module Turtle.Objects where

data Point = Point {
    xDimension :: Double,
    yDimension :: Double
} deriving (Show)

data Line = Line {
    fromPoint :: Point,
    toPoint :: Point
} deriving (Show)

data Canvas = Canvas {
    canvasWidth :: Double,
    canvasHeight :: Double,
    canvasLines :: [Line]
} deriving (Show)
 
data Turtle = Turtle {
    turtlePosition :: Point,
    turtleDirection :: Double,
    turtleCanvas :: Canvas
}
