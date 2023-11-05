module Geometry exposing
    ( affineT
    , articleWidth
    , photoHeight
    , ramp
    , ramp_
    , scale
    , scriptaArticleWidth
    , sidebarWidth
    , splitArticleWidth
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


sidebarWidth : { width : Int, height : Int } -> Int
sidebarWidth window =
    min 220 (scale 0.17 window.width)


articleWidth : { width : Int, height : Int } -> Int
articleWidth window =
    --min 700 (scale 0.5 window.width) |> Debug.log "@@ARTICLE WIDTH"
    -- ramp 550 900 (window.width |> Debug.log "@@WW") - sidebarWidth window |> Debug.log "@@WW:A"
    ramp 550 900 (window.width |> Debug.log "@@WW") - sidebarWidth window |> Debug.log "@@WW:A"


scriptaArticleWidth : { width : Int, height : Int } -> Int
scriptaArticleWidth window =
    -- min 700 (scale 0.3 window.width) |> Debug.log "@@SCRIPTA ARTICLE WIDTH"
    articleWidth window - 70 |> Debug.log "@@SCRIPTA ARTICLE WIDTH"


splitArticleWidth : { width : Int, height : Int } -> Int
splitArticleWidth window =
    articleWidth window // 2 - 15


photoHeight : { width : Int, height : Int } -> Int
photoHeight { width, height } =
    affineT 0.9 -80 height


scale : Float -> Int -> Int
scale factor x =
    round <| factor * toFloat x


affineT factor delta x =
    round <| factor * (toFloat x + delta)
