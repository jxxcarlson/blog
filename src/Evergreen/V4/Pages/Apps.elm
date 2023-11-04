module Evergreen.V4.Pages.Apps exposing (..)

import Evergreen.V4.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    }


type Msg
    = Render Evergreen.V4.Render.Msg.MarkupMsg
