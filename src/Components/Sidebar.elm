module Components.Sidebar exposing (view)

import Color
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import View exposing (View)


view :
    { title : String
    , attributes : List (Element msg)
    , element : Element msg
    , currentRoute : String
    }
    -> View msg
view props =
    let
        _ =
            Debug.log "@@routeString" props.currentRoute
    in
    { title = props.title
    , attributes = []
    , element =
        row [ centerX ]
            [ sidebar_ props.currentRoute
            , props.element
            ]
    }


sidebar_ currentRoute =
    column
        [ alignTop
        , Font.size 14
        , spacing 8
        , width (px 260)
        , height fill
        , paddingXY 24 12
        , Font.color Color.white
        , Background.color Color.sidebar
        ]
        [ item currentRoute "/" "Home"
        , item currentRoute "/about" "About"
        , item currentRoute "/art/experiment-chatgpt" "Art: ChatGPT"
        , item currentRoute "/photos/paris" "Photos: Paris"
        , item currentRoute "/science/champagne" "Science: Champagne"
        , item currentRoute "/science/reason-why" "Science: The Reason Why"
        , item currentRoute "/apps" "Apps"
        , item currentRoute "/counter" "Counter"
        ]


item currentRoute url title =
    if currentRoute == url then
        link [] { url = url, label = el [ Font.color Color.red ] (text title) }

    else
        link [] { url = url, label = el [] (text title) }
