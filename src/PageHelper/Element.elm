module PageHelper.Element exposing (article)

import Element exposing (..)
import Element.Font as Font


article : Document -> Element msg
article document =
    column [ spacing 24, paddingXY 24 24 ]
        [ title document.title
        , header document
        , compile document.content |> column [ Font.size 14, spacing 12, width (px 500) ]
        ]


header : Document -> Element msg
header doc =
    row [ spacing 12 ]
        [ image [ width (px 250) ] { src = doc.imageUrl, description = doc.imageDescription }
        , column [ width (px 250), alignTop ]
            [ column [ Font.size 14, spacing 12 ] (compile doc.contentHeader)
            ]
        ]


type alias Document =
    { title : String
    , imageUrl : String
    , imageDescription : String
    , contentHeader : String
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
