module Pages.Science exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaScience as Scripta
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
    ( { window = shared.dimensions, routeString = "/science" }, Effect.none )


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
Science

[i To your left: essays on science: some playful, some poetic, some serious.]

[i About the serious essays: these generally start out with material that
I try to make accessible to non-scientists and non-mathematicians.  The essays
then move on to more technical material.]


[i Below: some links]

- [link Feynman on Physics and Chess https://scripta.io/s/jxxcarlson:feynman-physics-chess]

- [link What is the World Made Of? https://scripta.io/s/jxxcarlson:what-is-the-world-made-of]

"""
