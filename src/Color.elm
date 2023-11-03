module Color exposing
    ( applet
    , black
    , buttonBG
    , buttonFG
    , sidebar
    , white
    )

import Element exposing (..)


applet =
    rgb 0.9 0.9 1.0


black =
    rgb 0.1 0.1 0.1


sidebar =
    rgb 0.3 0.3 0.35


buttonBG =
    rgb 0.2 0.2 0.4


buttonFG =
    gray 0.9


white =
    gray 0.9


gray c =
    rgb c c c
