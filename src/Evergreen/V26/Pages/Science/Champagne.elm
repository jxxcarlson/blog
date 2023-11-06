module Evergreen.V26.Pages.Science.Champagne exposing (..)

import Evergreen.V26.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = Render Evergreen.V26.Render.Msg.MarkupMsg
