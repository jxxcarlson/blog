module Pages.Home_ exposing (Model, Msg(..), page)

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
    ( { window = shared.window, routeString = "/" }, Effect.none )


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
        , currentRoute = model.routeString
        , element =
            row [ centerX ]
                [ Scripta.katexCSS
                , Scripta.display model.window src |> Element.map Render
                ]
        }



-- (Geometry.articleWidth model.window)


src =
    """
| title
Jim Carlson's Blog

[image https://pbs.twimg.com/profile_images/494780344793432069/TKbk_qRT_400x400.jpeg]
"""
