module Pages.Apps exposing (Model, Msg, page)

import Config
import Page exposing (Page)
import Element exposing(..)
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