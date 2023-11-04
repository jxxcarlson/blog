module Evergreen.V4.Pages.Science.Champagne exposing (..)

import Evergreen.V4.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    }


type Msg
    = Render Evergreen.V4.Render.Msg.MarkupMsg
