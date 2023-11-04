module Pages.Photos.Paris exposing (Model, Msg(..), page)

import Color
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { window : { width : Int, height : Int } }


type Msg
    = NoOp


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Effect.none )


view : Model -> View Msg
view model =
    { title = "Jim's Blog"
    , attributes = []
    , element = photoList model "Paris" parisPhotos
    }


photoList : Model -> String -> List ImageData -> Element msg
photoList model title images =
    column
        [ paddingXY 36 36
        , spacing 36
        , width (px 1500)
        , Font.color Color.white
        , Background.color Color.black
        ]
        [ row [ width (px model.window.width), spacing 24 ]
            [ el [ Font.color (rgb 0.6 0.6 0.6) ] (link [] { url = "/", label = el [] (text "Home") })
            , el [] (text title)
            ]
        , row [ spacing 24 ] (List.map (displayImage model) images)
        ]


type alias ImageData =
    { url : String
    , caption : String
    , details : String
    , year : Maybe Int
    , month : Maybe Int
    , location : Maybe String
    }


displayImage : Model -> ImageData -> Element msg
displayImage model imageData =
    column []
        [ image [ height (px (affineT 0.585 0 model.window.height)) ] { src = imageData.url, description = imageData.caption }
        , paragraph [ Font.size 14 ] [ text imageData.details ]
        ]


scale : Float -> Int -> Int
scale factor x =
    round <| factor * toFloat x


affineT factor delta x =
    round <| factor * (toFloat x + delta)


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
