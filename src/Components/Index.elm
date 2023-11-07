module Components.Index exposing (view)

import Color
import Config
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
    if dimensions.width < Config.mobileWidth then
        mobileView dimensions props

    else
        desktopView dimensions props


mobileView dimensions props =
    { title = props.title
    , attributes = []
    , element =
        row []
            [ lhs dimensions
            , props.element
            ]
    }


desktopView dimensions props =
    { title = props.title
    , attributes = []
    , element =
        row []
            [ lhs dimensions
            , sidebar_ dimensions props.currentRoute
            , props.element
            ]
    }


lhs window =
    column
        [ width (px (Geometry.lhsWidth window))
        , height (px window.height)
        , Background.color Color.borderColor
        ]
        []


fontSize dimensions =
    if dimensions.width < 800 then
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
        , Font.size 12
        , paddingXY 18 18
        , Font.color Color.white
        , Background.color Color.sidebar
        ]
        [ item currentRoute "/" "Home"
        , item currentRoute "/about" "About"
        , item currentRoute "/art/experiment-chatgpt" "Art: ChatGPT"
        , item currentRoute "/photos/n-y-c" "Photos: New York City"
        , item currentRoute "/photos/paris" "Photos: Paris"
        , item currentRoute "/science/champagne" "Science: Champagne"
        , item currentRoute "/science/reason-why" "Science: The Reason Why"
        , item currentRoute "/math/entropy" "Math: Entropy"
        , item currentRoute "/apps" "Apps"
        , el [ alignBottom, Font.size (fontSize dimensions), Font.color Color.red ] (text <| "w = " ++ String.fromInt dimensions.width ++ ", h = " ++ String.fromInt dimensions.height)

        --, item currentRoute "/counter" "Counter"
        ]


item currentRoute url title =
    if currentRoute == url then
        link [] { url = url, label = el [ Font.color Color.red ] (text title) }

    else
        link [] { url = url, label = el [] (text title) }
