module Scripta exposing (display, element, katexCSS)

import Components.Sidebar as Sidebar
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Geometry
import Html
import Html.Attributes
import Render.Msg exposing (MarkupMsg)
import ScriptaV2.API
import ScriptaV2.Language
import Shared.Msg
import View


element window content =
    row []
        [ katexCSS
        , display window content
        ]


katexCSS =
    Element.html <|
        Html.node "link"
            [ Html.Attributes.attribute "rel" "stylesheet"
            , Html.Attributes.attribute "href" "https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css"
            ]
            []


compile : Int -> String -> List (Element MarkupMsg)
compile width src =
    ScriptaV2.API.compile
        ScriptaV2.Language.L0Lang
        width
        0
        "no selected Id"
        (String.lines src)


display : { width : Int, height : Int } -> String -> Element MarkupMsg
display window src =
    column
        [ spacing 4
        , Background.color (Element.rgb 1 1 1)
        , clipX
        , width (px (Geometry.articleWidth window |> Debug.log "@@@@ articleWidth"))
        , height (px window.height)
        , Font.size 14
        , paddingXY 16 32
        , htmlId "rendered-text"
        , scrollbarY
        ]
        (compile (Geometry.scriptaArticleWidth window) src)


htmlId str =
    Element.htmlAttribute (Html.Attributes.id str)



--view : { a | window : { width : Int, height : Int }, title : String, content : String, routeString : String } -> View.View MarkupMsg
--view data =
--    Sidebar.view data.window
--        { title = data.title
--        , attributes = []
--        , element =
--            row []
--                [ katexCSS
--                , display data.window data.content
--                ]
--        , currentRoute = data.routeString
--        }
--view window routeString title content =
--    { title = title
--    , attributes = []
--    , element =
--        row []
--            [ katexCSS
--            , display window content
--            ]
--    , currentRoute = routeString
--    }
