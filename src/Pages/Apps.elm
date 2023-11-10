module Pages.Apps exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaApps as Scripta
import Effect exposing (Effect)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


type alias Model =
    Blog.Model.Model


type alias Msg =
    Blog.Msg.Msg


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/apps" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Blog.Msg.Render _ ->
            ( model, Effect.none )


view : { width : Int, height : Int } -> Model -> View Blog.Msg.Msg
view window model =
    Scripta.view content window model


content =
    """
| title
Apps

[large [i A small collection of apps made with the [link Elm programming language https://elm-lang.org].
Click on the links on the left to try them out.]]

[vspace 1]

[b Brief descriptions]

- Drum Machine app:
turns text into drum sounds.

- Random Exchange Model: a radically simplified model of a small economy. Has some implications
for distribution and tax policy despite its simplicity.
"""
