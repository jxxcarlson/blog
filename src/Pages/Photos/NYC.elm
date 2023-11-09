module Pages.Photos.NYC exposing (..)

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
    ( { window = shared.dimensions, routeString = "/photos/paris" }, Effect.none )


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
    , element = photoList model "New York City" nycPhotos
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
            [ spacing 48
            ]
            [ el [ Font.color (rgb 0.6 0.6 0.6) ] (link [] { url = "/", label = el [] (text "Home") })
            , el [ Font.color (rgb 0.6 0.6 0.6) ] (link [] { url = "/photos", label = el [] (text "Photos") })
            , el [] (text title)
            , el [ Font.color (rgb 0.6 0.6 0.6) ] (link [] { url = "/photos/paris", label = el [] (text "Paris") })
            ]
        , row
            [ height (px <| 40 + Geometry.photoHeight model.window)
            , width (px <| model.window.width)
            , paddingXY 24 0
            , spacing 72
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


nycPhotos =
    [ fromTheHighline
    , highLineFlowers2
    , highLineFlowers
    , neighborhoodPlace
    , playgroundLenoxAvenue
    , sylvanaJazz

    --, dockScene
    ]


neighborhoodPlace =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/a8ac063b-388f-45d2-4763-9c732f024c00/public"
    , caption = "Our Neighborhood Place, New York City 2023"
    , details = "Harlem 127th Street, 2023"
    , year = Just 2023
    , month = Just 8
    , location = Just "New York City"
    }


playgroundLenoxAvenue =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/55bf83b2-99ec-4f3a-0ac0-41e22b436300/public"
    , caption = "Playground, New York City 2023"
    , details = "Playground, Lenox Avenue. New York City 2023"
    , year = Just 2023
    , month = Just 8
    , location = Just "New York City"
    }


sylvanaJazz =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/d3316e61-b421-4b1c-3086-66b1ee7e7c00/public"
    , caption = "Sylvana's, New York City 2023"
    , details = "Sylvana's, New York City 2023"
    , year = Just 2023
    , month = Just 8
    , location = Just "New York City"
    }


fromTheHighline =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/fa394e98-4544-4f43-1cad-a92f6d34ca00/public"
    , caption = "From the Highline, New York City 2023"
    , details = "From the Highline, New York City 2023"
    , year = Just 2023
    , month = Just 8
    , location = Just "New York City"
    }


highLineFlowers2 =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/4229b092-5690-4ddc-0633-43ab41182a00/public"
    , caption = "Highline, New York City 2023"
    , details = "Highline, New York City 2023"
    , year = Just 2023
    , month = Just 8
    , location = Just "New York City"
    }


dockScene =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/c3e8ee59-64c4-4507-cf19-84a9345aae00/public"
    , caption = "Dock Scene, NYC 2023"
    , details = "Dock Scene, NYC 2023"
    , year = Just 2023
    , month = Just 1
    , location = Just "New York City"
    }


highLineFlowers =
    { url = "https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/707e7cd7-780a-4043-f49c-32e8fee5a600/public"
    , caption = "Highline, New York City 2023"
    , details = "Highline, New York City 2023"
    , year = Just 2020
    , month = Just 8
    , location = Just "New York City"
    }
