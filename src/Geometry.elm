module Geometry exposing (articleWidth)


articleWidth : { width : Int, height : Int } -> Int
articleWidth { width, height } =
    min width 600
