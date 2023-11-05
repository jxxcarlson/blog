module Components.Sidebar exposing (view)

import Color
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Geometry
import View exposing (View)


view :
    { width : Int, height : Int }
    ->
        { title : String
        , attributes : List (Element msg)
        , element : Element msg
        , currentRoute : String
        }
    -> View msg
view dimensions props =
    let
        _ =
            Debug.log "@@S, DIM" dimensions
    in
    { title = props.title
    , attributes = []
    , element =
        row []
            [ sidebar_ dimensions props.currentRoute
            , props.element
            ]
    }


fontSize dimensions =
    if dimensions.width < 600 then
        8

    else if dimensions.width < 800 then
        10

    else if dimensions.width < 1000 then
        12

    else
        14


sidebar_ dimensions currentRoute =
    column
        [ alignTop
        , Font.size (fontSize dimensions)
        , spacing 8
        , width (px <| Geometry.sidebarWidth dimensions)
        , height fill
        , paddingXY 12 12
        , Font.color Color.white
        , Background.color Color.sidebar
        ]
        [ item currentRoute "/" "Home"
        , item currentRoute "/about" "About"
        , item currentRoute "/art/experiment-chatgpt" "Art: ChatGPT"
        , item currentRoute "/photos/paris" "Photos: Paris"
        , item currentRoute "/science/champagne" "Science: Champagne"
        , item currentRoute "/science/reason-why" "Science: The Reason Why"
        , item currentRoute "/math/entropy" "Math: Entropy"
        , item currentRoute "/apps" "Apps"
        , el [ Font.size (fontSize dimensions), Font.color Color.red ] (text <| "w = " ++ String.fromInt (Geometry.articleWidth dimensions))

        --, item currentRoute "/counter" "Counter"
        ]


item currentRoute url title =
    if currentRoute == url then
        link [] { url = url, label = el [ Font.color Color.red ] (text title) }

    else
        link [] { url = url, label = el [] (text title) }
