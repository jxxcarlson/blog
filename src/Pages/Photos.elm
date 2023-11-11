module Pages.Photos exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaPhotos as Scripta
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
    ( { window = shared.dimensions, routeString = "/photos" }, Effect.none )


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
Photos

[large [i Visit the photo collections in the left-hand side bar]].

[vspace 20]

[large [b New York City]]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/d3316e61-b421-4b1c-3086-66b1ee7e7c00/public width:to-sides]

[large[b  Paris]]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/b447efe8-7df0-4070-6533-00f42ef18f00/public width:to-sides]

"""
