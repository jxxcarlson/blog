module Evergreen.V12.Pages.Math.Entropy exposing (..)

import Evergreen.V12.Render.Msg


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = Render Evergreen.V12.Render.Msg.MarkupMsg
