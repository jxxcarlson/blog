module Geometry exposing (affineT, articleWidth, scale)


articleWidth : { width : Int, height : Int } -> Int
articleWidth { width, height } =
    min 700 (width // 2)


scale : Float -> Int -> Int
scale factor x =
    round <| factor * toFloat x


affineT factor delta x =
    round <| factor * (toFloat x + delta)
