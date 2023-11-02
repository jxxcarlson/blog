module Pages.About exposing (Model, Msg, page)

import Config
import Element exposing(..)
import Page exposing (Page)
import View exposing (View)
import Render.Msg exposing (MarkupMsg)
import Scripta
import Components.Sidebar

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
        Render _ -> model



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
     { title = "Scripta"
     , attributes = []
     , element = row [centerX] [
          Scripta.katexCSS
        , Scripta.display Config.articleWidth  700 src |> Element.map Render
     ]

     }


src = """
| title
About

At the moment, this is just a test to see if I can use Elm Land + Lamdera with
the Scripta compiler to make a blog.  So far, so good.

Elm Land's design, power, and ease of use are impressive.
"""