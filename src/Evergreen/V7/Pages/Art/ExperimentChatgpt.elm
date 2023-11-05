module Evergreen.V7.Pages.Art.ExperimentChatgpt exposing (..)

import Evergreen.V7.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = Render Evergreen.V7.Render.Msg.MarkupMsg
