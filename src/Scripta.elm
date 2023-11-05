module Scripta exposing (display, katexCSS)

import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Html
import Html.Attributes
import Render.Msg exposing (MarkupMsg)
import ScriptaV2.API
import ScriptaV2.Language


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
        0
        "no selected Id"
        (String.lines src)


display : { width : Int, height : Int } -> String -> Element MarkupMsg
display window src =
    column [ Font.size 18, width (px window.width) ]
        [ column
            [ spacing 4
            , Background.color (Element.rgb 1 1 1)
            , centerX
            , height (px window.height)
            , Font.size 14
            , paddingXY 16 32
            , htmlId "rendered-text"
            , scrollbarY
            ]
            (compile (window.width - 50) src)
        ]


htmlId str =
    Element.htmlAttribute (Html.Attributes.id str)
