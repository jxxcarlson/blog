module Geometry exposing
    ( affineT
    , articleWidth
    , photoHeight
    , scale
    , scriptaArticleWidth
    , sidebarWidth
    , splitArticleWidth
    )


sidebarWidth : { width : Int, height : Int } -> Int
sidebarWidth window =
    min 220 (scale 0.17 window.width)


articleWidth : { width : Int, height : Int } -> Int
articleWidth { width, height } =
    min 700 (scale 0.5 width) |> Debug.log "@@ARTICLE WIDTH"


scriptaArticleWidth : { width : Int, height : Int } -> Int
scriptaArticleWidth { width, height } =
    min 700 (scale 0.3 width) |> Debug.log "@@SCRIPTA ARTICLE WIDTH"


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
