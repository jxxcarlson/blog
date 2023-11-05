module Pages.Apps exposing (Model, Msg(..), page)

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
    { window : { width : Int, height : Int }
    , routeString : String
    }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window, routeString = "/apps" }, Effect.none )


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
        , currentRoute = model.routeString
        }


src =
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
