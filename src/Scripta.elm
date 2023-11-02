module Scripta exposing (display, katexCSS)

import ScriptaV2.Compiler
import ScriptaV2.API
import ScriptaV2.Language
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Html.Attributes
import Render.Msg exposing (MarkupMsg)
import Html

import Components.Sidebar


katexCSS =
    Element.html <|
        Html.node "link"
            [ Html.Attributes.attribute "rel" "stylesheet"
            , Html.Attributes.attribute "href" "https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css"
            ]
            []

compile width src =
  ScriptaV2.API.compile
    ScriptaV2.Language.L0Lang
    width
    0    -- count
    "no selected Id"
    (String.lines src)


display : Int -> Int -> String -> Element MarkupMsg
display width_ height_ src =
   column [ Font.size 18 ]
        [ column
            [ spacing 4
            , Background.color (Element.rgb 1  1 1)
            , width (px width_)
            , height (px height_)
            , Font.size 14
            , paddingXY 16 32
            , htmlId "rendered-text"
            , scrollbarY
            ]
            (compile (width_ - 50) src)
        ]
   

htmlId str =
    Element.htmlAttribute (Html.Attributes.id str)
