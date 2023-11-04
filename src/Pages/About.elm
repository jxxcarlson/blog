module Pages.About exposing (Model, Msg(..), page)

import Components.Sidebar
import Effect exposing (Effect)
import Element exposing (..)
import Page exposing (Page)
import Render.Msg exposing (MarkupMsg)
import Route exposing (Route)
import Scripta
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


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


type Msg
    = Render MarkupMsg


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Render _ ->
            ( model, Effect.none )



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , element =
            row [ centerX ]
                [ Scripta.katexCSS
                , Scripta.display model.window src |> Element.map Render
                ]
        }


src =
    """
| title
About

At the moment, this is just a test to see if I can use Elm Land + Lamdera with
the Scripta compiler to make a blog.  So far, so good.

Elm Land's design, power, and ease of use are impressive.
"""
