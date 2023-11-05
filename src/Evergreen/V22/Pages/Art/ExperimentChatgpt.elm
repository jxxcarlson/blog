module Evergreen.V22.Pages.Art.ExperimentChatgpt exposing (..)

import Evergreen.V22.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = Render Evergreen.V22.Render.Msg.MarkupMsg
