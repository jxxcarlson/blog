module Blog.Scripta2 exposing (display, element, katexCSS, view)

import Blog.Model
import Blog.Msg
import Color
import Components.Index
import Components.IndexPhone
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Geometry
import Html
import Html.Attributes
import Page exposing (Page)
import Render.Msg exposing (MarkupMsg)
import Route exposing (Route)
import ScriptaV2.API
import ScriptaV2.Language
import Shared
import View exposing (View)


view content window model =
    view content window model


type alias Model =
    Blog.Model.Model


type alias Msg =
    Blog.Msg.Msg


page : String -> Shared.Model -> Route () -> Page Model Msg
page src shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view src shared.dimensions
        , subscriptions = subscriptions
        }



-- INIT


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/science/champagne" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Blog.Msg.Render _ ->
            ( model, Effect.none )



-- view : String -> { width : Int, height : Int } -> { a | routeString : String } -> View Blog.Msg.Msg
--view src window model =
--    Components.Index.view window
--        { title = "Jim's Blog"
--        , attributes = []
--        , element = element window src |> Element.map Blog.Msg.Render
--        , currentRoute = model.routeString
--        }


element : { width : Int, height : Int } -> String -> Element MarkupMsg
element window content =
    row []
        [ katexCSS
        , display window content
        , rhs window
        ]


rhs window =
    column
        [ width (px (Geometry.rhsWidth window))
        , height (px window.height)
        , Background.color Color.borderColor
        ]
        []


katexCSS =
    Element.html <|
        Html.node "link"
            [ Html.Attributes.attribute "rel" "stylesheet"
            , Html.Attributes.attribute "href" "https://cdn.jsdelivr.net/npm/katex@0.16.9/dist/katex.min.css"
            ]
            []


compile : Int -> String -> List (Element MarkupMsg)
compile width src =
    ScriptaV2.API.compile
        ScriptaV2.Language.L0Lang
        width
        0
        "no selected Id"
        (String.lines src)


display : { width : Int, height : Int } -> String -> Element MarkupMsg
display window src =
    column
        [ spacing 4
        , Background.color (Element.rgb 1 1 1)
        , clipX
        , width (px (Geometry.articleWidth window |> Debug.log "@@@@ articleWidth"))
        , height (px window.height)
        , Font.size 14
        , paddingXY 16 32
        , htmlId "rendered-text"
        , scrollbarY
        ]
        (compile (Geometry.scriptaArticleWidth window) src)


htmlId str =
    Element.htmlAttribute (Html.Attributes.id str)
