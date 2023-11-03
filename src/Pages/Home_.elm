module Pages.Home_ exposing (Model, Msg(..), page)

import Components.Sidebar
import Config
import Element exposing (..)
import Page exposing (Page)
import Render.Msg exposing (MarkupMsg)
import Scripta
import View exposing (View)


page : Page Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = Render MarkupMsg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Render _ ->
            model



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
        { title = "Scripta"
        , attributes = []
        , element =
            row [ centerX ]
                [ Scripta.katexCSS
                , Scripta.display Config.articleWidth 700 src |> Element.map Render
                ]
        }


src =
    """
| title
Jim Carlson's Blog

[image https://pbs.twimg.com/profile_images/494780344793432069/TKbk_qRT_400x400.jpeg]
"""
