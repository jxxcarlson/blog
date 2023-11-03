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
    }
    -> View msg
view props =
    { title = props.title
    , attributes = []
    , element =
        row [ centerX ]
            [ sidebar_
            , props.element
            ]
    }


sidebar_ =
    column
        [ alignTop
        , Font.size 16
        , spacing 8
        , paddingXY 24 12
        , Background.color Color.sidebar
        ]
        [ link [] { url = "/", label = el [] (text "Home") }
        , link [] { url = "/about", label = el [] (text "About") }
        , link [] { url = "/photos/paris", label = el [] (text "Paris: Photos") }
        , link [] { url = "/science/champagne", label = el [] (text "Science: Champagne") }
        , link [] { url = "/apps", label = el [] (text "Apps") }
        , link [] { url = "/counter", label = el [] (text "Counter") }
        , link [] { url = "/scripta", label = el [] (text "Scripta") }
        ]
