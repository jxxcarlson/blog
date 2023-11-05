module Evergreen.V9.Pages.Science.Champagne exposing (..)

import Evergreen.V9.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = Render Evergreen.V9.Render.Msg.MarkupMsg
