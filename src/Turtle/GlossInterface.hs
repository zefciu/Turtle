module Turtle.GlossInterface where 

import GHC.Float

import qualified Graphics.Gloss as Gloss
import qualified Turtle.Objects as Turtle

point2Gloss :: Turtle.Point -> Gloss.Point
point2Gloss point = (double2Float (Turtle.xDimension point),
    double2Float (Turtle.yDimension point))

line2Pic :: Turtle.Line -> Gloss.Picture
line2Pic line = Gloss.Line
    [point2Gloss (Turtle.fromPoint line), point2Gloss (Turtle.toPoint line)]

canv2Pic :: Turtle.Canvas -> Gloss.Picture
canv2Pic canv = Gloss.Pictures (map line2Pic (Turtle.canvasLines canv))

displayCanvas :: Turtle.Canvas -> (Int, Int) ->  IO ()
displayCanvas canv position = Gloss.display
    (Gloss.InWindow
        "Turtle" (canvWidth, canvHeight) position)
    Gloss.white (canv2Pic canv)
    where canvWidth = round (Turtle.canvasWidth canv) :: Int
          canvHeight = round (Turtle.canvasHeight canv) ::Int
