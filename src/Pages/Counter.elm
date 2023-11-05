module Pages.Counter exposing (Model, Msg(..), page)

import Color
import Components.Sidebar
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import Style
import View exposing (View)



-- PAGE


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
    , counter : Int
    , routeString : String
    }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/counter", counter = 0 }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- UPDATE


type Msg
    = UserClickedIncrement
    | UserClickedDecrement


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        UserClickedIncrement ->
            ( { model | counter = model.counter + 1 }, Effect.none )

        UserClickedDecrement ->
            ( { model | counter = model.counter - 1 }, Effect.none )



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , currentRoute = model.routeString
        , element =
            column [ width (px model.window.width), height (px model.window.height), Border.width 1 ]
                [ row
                    [ spacing 12
                    , centerX
                    , moveDown (toFloat model.window.height * 0.25)
                    , Background.color Color.applet
                    , Border.width 1
                    , padding 24
                    ]
                    [ Input.button (Style.button (px 40) (px 40) []) { onPress = Just UserClickedIncrement, label = el [ centerX ] (text "+") }
                    , el []
                        (text (String.fromInt model.counter))
                    , Input.button (Style.button (px 40) (px 40) []) { onPress = Just UserClickedDecrement, label = el [ centerX ] (text "-") }
                    ]
                ]
        }
