module Color exposing
    ( applet
    , black
    , borderColor
    , buttonBG
    , buttonFG
    , red
    , sidebar
    , white
    )

import Element exposing (..)


gray_ : Float -> Color
gray_ g =
    Element.rgb g g (1.2 * g)


wgray_ : Float -> Color
wgray_ g =
    Element.rgb (1.05 * g) g g


sidebar : Color
sidebar =
    gray_ 0.2


borderColor : Color
borderColor =
    wgray_ 0.5


applet : Color
applet =
    rgb 0.9 0.9 1.0


black =
    rgb 0.1 0.1 0.1


buttonBG =
    rgb 0.2 0.2 0.4


buttonFG =
    gray 0.9


white =
    gray 0.9


gray c =
    rgb c c c


red =
    rgb 0.99 0.5 0.5
