module Turtle.Commands where

import Turtle.Objects
import Turtle.Arcs

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
