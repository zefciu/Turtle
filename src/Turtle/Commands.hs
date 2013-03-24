module Turtle.Commands where

import Turtle.Objects
import Turtle.Arcs

deg2rad :: Double -> Double
deg2rad deg = (deg / 180) * pi

turnTurtle :: Bool -> Double -> Turtle -> Turtle
turnTurtle rt arc turtle =
    Turtle
        (turtlePosition turtle)
        ((turtleDirection turtle) `rotFunc` arc)
        (turtleHasPenUp turtle)
        (turtleCanvas turtle)
    where rotFunc = if rt then addArc else subArc

turnRight = turnTurtle True
turnLeft = turnTurtle False

penChange :: Bool -> Turtle -> Turtle
penChange up turtle = Turtle
        (turtlePosition turtle)
        (turtleDirection turtle)
        up
        (turtleCanvas turtle)

penUp = penChange True
penDown = penChange False

canvasDrawLine :: Point -> Point -> Canvas -> Canvas
canvasDrawLine f t can = Canvas
    (canvasWidth can)
    (canvasHeight can)
    ((Line f t):(canvasLines can))


changeTurtlePos :: Point -> Turtle -> Turtle
changeTurtlePos point turtle = Turtle
    point
    (turtleDirection turtle)
    (turtleHasPenUp turtle)
    (if (turtleHasPenUp turtle)
        then canvas
        else (canvasDrawLine (turtlePosition turtle) point canvas))
    where canvas = turtleCanvas turtle

calculateNewPosition :: Point -> Double -> Bool -> Double -> Point
calculateNewPosition oldPosition direction forward length = Point
    ((xDimension oldPosition) + (sin (deg2rad direction) * length * sign))
    ((yDimension oldPosition) + (cos (deg2rad direction) * length * sign))
    where sign = if forward then 1 else -1

type Command = Turtle -> Turtle
type Commands = [Command]
    
        
moveTurtle :: Bool -> Double -> Turtle -> Turtle
moveTurtle forward length turtle = changeTurtlePos
    (calculateNewPosition
        (turtlePosition turtle) (turtleDirection turtle) forward length) turtle

forward = moveTurtle True
back = moveTurtle False
    
execute :: Turtle -> [Turtle -> Turtle] -> Turtle
execute turtle [] = turtle
execute turtle (command:commands) = execute (command turtle) commands

