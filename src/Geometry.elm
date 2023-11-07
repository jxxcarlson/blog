module Geometry exposing
    ( affineT
    , articleWidth
    , lhsWidth
    , photoHeight
    , rhsWidth
    , scale
    , scriptaArticleWidth
    , sidebarWidth
    )

import Config


maxContentWidth : Int
maxContentWidth =
    800


contentWidth : { width : Int, height : Int } -> Int
contentWidth window =
    if window.width < maxContentWidth then
        window.width

    else
        800


sidebarWidth : { width : Int, height : Int } -> Int
sidebarWidth window =
    if window.width < Config.mobileWidth then
        0

    else
        scale 0.25 (contentWidth window)


articleWidth : { width : Int, height : Int } -> Int
articleWidth window =
    if window.width < Config.mobileWidth then
        contentWidth window |> Debug.log "@@!!ARTICLE WIDTH (1)"

    else
        scale 0.75 (contentWidth window) |> Debug.log "@@!!ARTICLE WIDTH (2)"


scriptaArticleWidth : { width : Int, height : Int } -> Int
scriptaArticleWidth window =
    articleWidth window - 40


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
