module Pages.Apps exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Effect exposing (Effect)
import Page exposing (Page)
import Route exposing (Route)
import Scripta
import Shared


type alias Model =
    Blog.Model.Model


type alias Msg =
    Blog.Msg.Msg


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Blog.Msg.Render _ ->
            ( model, Effect.none )


view window model =
    Scripta.view content window model


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/about" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }


content =
    """
| title
Apps

[vspace 30]

[i A small collection of Elm apps ... more apps and more explanatory text to come.]

# Techno Drum Language App

[link The App https://jxxcarlson.github.io/app/drumlanguage.html]

[image https://global.discourse-cdn.com/standard17/uploads/elm_lang/optimized/2X/9/9b1b0a2734e88c93dc91e5cb711f32cb965d4ef1_2_1096x1000.png  width:350]

# Random Exchange Model

[link The App https://jxxcarlson.github.io/app/small-economy/index.html]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/69b4376a-51e8-41aa-8d29-4df56e40b900/public  width:350]
"""
