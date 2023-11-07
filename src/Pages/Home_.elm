module Pages.Home_ exposing (Model, Msg(..), page)

import Components.Index
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
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { window : { width : Int, height : Int }
    , routeString : String
    }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/" }, Effect.none )


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


view : { width : Int, height : Int } -> Model -> View Msg
view window model =
    Components.Index.view window
        { title = "Jim's Blog"
        , attributes = []
        , element = Scripta.element window src |> Element.map Render
        , currentRoute = model.routeString
        }



-- (Geometry.articleWidth model.window)


src =
    """
| title
Jim Carlson's Blog

[image https://pbs.twimg.com/profile_images/494780344793432069/TKbk_qRT_400x400.jpeg]
"""
