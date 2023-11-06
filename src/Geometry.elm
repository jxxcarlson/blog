module Geometry exposing
    ( affineT
    , articleWidth
    , lhsWidth
    , photoHeight
    , ramp
    , ramp_
    , rhsWidth
    , scale
    , scriptaArticleWidth
    , sidebarWidth
    )


ramp : Int -> Int -> Int -> Int
ramp min max x =
    if x < min then
        min

    else if x > max then
        max

    else
        ramp_ min max x + min


ramp_ : Int -> Int -> Int -> Int
ramp_ min max x =
    let
        range =
            max - min

        factor =
            toFloat (x - min) / toFloat range
    in
    round <| factor * toFloat (x - min)


minContentWidth : Int
minContentWidth =
    400


maxContentWidth : Int
maxContentWidth =
    800


contentWidth : { width : Int, height : Int } -> Int
contentWidth window =
    ramp minContentWidth maxContentWidth window.width


sidebarWidth : { width : Int, height : Int } -> Int
sidebarWidth window =
    -- ramp 200 300 window.width
    scale 0.25 (contentWidth window)


articleWidth : { width : Int, height : Int } -> Int
articleWidth window =
    scale 0.75 (contentWidth window)


scriptaArticleWidth : { width : Int, height : Int } -> Int
scriptaArticleWidth window =
    -- min 700 (scale 0.3 window.width) |> Debug.log "@@SCRIPTA ARTICLE WIDTH"
    articleWidth window - 140 |> Debug.log "@@SCRIPTA ARTICLE WIDTH"


rhsWidth : { width : Int, height : Int } -> Int
rhsWidth window =
    if window.width < 810 then
        0

    else
        scale 0.5 (window.width - contentWidth window)


lhsWidth : { width : Int, height : Int } -> Int
lhsWidth window =
    if window.width < 810 then
        0

    else
        scale 0.5 (window.width - contentWidth window)


photoHeight : { width : Int, height : Int } -> Int
photoHeight { width, height } =
    affineT 0.9 -80 height


scale : Float -> Int -> Int
scale factor x =
    round <| factor * toFloat x


affineT factor delta x =
    round <| factor * (toFloat x + delta)
