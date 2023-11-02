module Pages.Photos.Paris exposing (page)

import Color
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import View exposing (View)


page : View msg
page =
    { title = "Photos.Paris"
    , attributes = []
    , element = photoList "Paris" parisPhotos
    }


photoList title images =
    column
        [ paddingXY 36 36
        , spacing 36
        , width (px 1500)
        , Font.color Color.white
        , Background.color Color.black
        ]
        [ el [] (text title)
        , row [ spacing 24 ] (List.map displayImage images)
        ]


type alias ImageData =
    { url : String
    , caption : String
    , details : String
    , year : Maybe Int
    , month : Maybe Int
    , location : Maybe String
    }


displayImage : ImageData -> Element msg
displayImage imageData =
    column []
        [ image [ height (px 650) ] { src = imageData.url, description = imageData.caption }
        , paragraph [ Font.size 14 ] [ text imageData.details ]
        ]


parisPhotos =
    [ paris1
    , paris2
    , paris3
    ]


paris1 =
    { url = "https://jxxcarlsonblog.files.wordpress.com/2020/05/img_0877.jpg"
    , caption = "Paris"
    , details = "Paris, 2020"
    , year = Just 2020
    , month = Just 3
    , location = Just "Paris"
    }


paris2 =
    { url = "https://jxxcarlsonblog.files.wordpress.com/2020/05/lichens.jpg"
    , caption = "Paris"
    , details = "Wherever it can be, it is"
    , year = Just 2020
    , month = Nothing
    , location = Just "Paris"
    }


paris3 =
    { url = "https://jxxcarlsonblog.files.wordpress.com/2020/04/img_1100.jpeg"
    , caption = "Paris"
    , details = "Late Afternoon"
    , year = Just 2020
    , month = Nothing
    , location = Just "Paris"
    }
