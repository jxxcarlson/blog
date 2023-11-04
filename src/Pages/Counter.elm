module Pages.Counter exposing (Model, Msg(..), page)

import Color
import Components.Sidebar
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Input as Input
import Html exposing (Html)
import Page exposing (Page)
import Style
import View exposing (View)



-- PAGE


page : Page Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    { counter : Int
    }


init : Model
init =
    { counter = 0
    }



-- UPDATE


type Msg
    = UserClickedIncrement
    | UserClickedDecrement


update : Msg -> Model -> Model
update msg model =
    case msg of
        UserClickedIncrement ->
            { model | counter = model.counter + 1 }

        UserClickedDecrement ->
            { model | counter = model.counter - 1 }



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , element =
            column [ width (px 400), height (px 400), Border.width 1, moveDown 20, moveRight 20 ]
                [ row [ spacing 12, centerX, centerY, Background.color Color.applet, Border.width 1, padding 24 ]
                    [ Input.button (Style.button (px 40) (px 40) []) { onPress = Just UserClickedIncrement, label = el [ centerX ] (text "+") }
                    , el []
                        (text (String.fromInt model.counter))
                    , Input.button (Style.button (px 40) (px 40) []) { onPress = Just UserClickedDecrement, label = el [ centerX ] (text "-") }
                    ]
                ]
        }
