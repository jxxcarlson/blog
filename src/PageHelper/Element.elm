module PageHelper.Element exposing (article)

import Config
import Element exposing (..)
import Element.Font as Font
import Geometry
import Render.Msg
import Scripta


article : Document -> { width : Int, height : Int } -> Element Render.Msg.MarkupMsg
article document window =
    column [ spacing 24, paddingXY 24 24 ]
        [ title document.title
        , header document

        --, compile document.content |> column [ Font.size 14, spacing 12, width (px 500) ]
        , element window document.content
        ]


element window src =
    row [ centerX ]
        [ Scripta.katexCSS
        , Scripta.display (Geometry.articleWidth window) window.height src -- |> Element.map Render
        ]


header : Document -> Element msg
header doc =
    case
        doc.contentHeader
    of
        Just str ->
            splitHeader doc str

        Nothing ->
            imageHeader doc


splitHeader : Document -> String -> Element msg
splitHeader doc str =
    row [ spacing 12 ]
        [ image [ width (px 300) ] { src = doc.imageUrl, description = doc.imageDescription }
        , column [ width (px 300), alignTop ]
            [ column [ Font.size 14, spacing 12 ] (compile str)
            ]
        ]


imageHeader : Document -> Element msg
imageHeader doc =
    image [ width (px 600) ] { src = doc.imageUrl, description = doc.imageDescription }


type alias Document =
    { title : String
    , imageUrl : String
    , imageDescription : String
    , contentHeader : Maybe String
    , content : String
    }


title : String -> Element msg
title str =
    el [ Font.size 24 ] (Element.text str)


compile : String -> List (Element msg)
compile str =
    List.map transform (String.split "\n\n" str)


transform : String -> Element msg
transform str =
    if String.left 12 str == "@subheading " then
        paragraph [ Font.bold ] [ Element.text (String.dropLeft 12 str) ]

    else
        paragraph [] [ Element.text str ]
