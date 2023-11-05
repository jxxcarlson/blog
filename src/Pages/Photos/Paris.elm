module Pages.Photos.Paris exposing (Model, Msg(..), page)

import Color
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Geometry
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
    { window : { width : Int, height : Int }
    , routeString : String
    }


type Msg
    = NoOp


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window, routeString = "/photos/paris" }, Effect.none )


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
        , Font.color Color.white
        , Background.color Color.black
        ]
        [ row
            [ spacing 24
            ]
            [ el [ Font.color (rgb 0.6 0.6 0.6) ] (link [] { url = "/", label = el [] (text "Home") })
            , el [] (text title)
            ]
        , row
            [ height (px <| 40 + Geometry.photoHeight model.window)
            , width (px <| Debug.log "@@PHOTO WW" <| model.window.width)
            , paddingXY 24 0
            , spacing 24
            , scrollbarX
            ]
            (List.map (displayImage model) images)
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
    column [ spacing 8 ]
        [ image [ height (px <| Geometry.photoHeight model.window) ] { src = imageData.url, description = imageData.caption }
        , paragraph [ Font.size 14 ] [ text imageData.details ]
        ]


parisPhotos =
    [ paris1
    , paris2
    , paris3
    , paris4
    , paris5
    , paris6
    , paris7
    ]


paris7 =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/cd204c51-5c26-45f3-c2b6-2b00cf525600/public"
    , caption = "Place de la Concorde"
    , details = "Place de la Concorde, March 2020"
    , year = Just 2020
    , month = Just 3
    , location = Just "Paris"
    }


paris6 =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/364100de-5ef8-47e1-9a91-c527f84a2600/public"
    , caption = "Monet gardens"
    , details = "Giverny, June 2020"
    , year = Just 2020
    , month = Just 6
    , location = Just "Paris"
    }


paris5 =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/34c3e4ab-3e3b-4709-4aff-0628aa08fb00/public"
    , caption = "Monet gardens"
    , details = "Giverny, June 2020"
    , year = Just 2020
    , month = Just 6
    , location = Just "Paris"
    }


paris4 =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/b447efe8-7df0-4070-6533-00f42ef18f00/public"
    , caption = "Rue Claude Monet"
    , details = "Giverny, June 2020"
    , year = Just 2020
    , month = Just 6
    , location = Just "Paris"
    }



-- https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/1a038709-7478-41a8-4e85-13eaf26a7e00/public


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
