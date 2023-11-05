module Evergreen.V12.Shared.Msg exposing (..)

import Evergreen.V12.Ports
import Evergreen.V12.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V12.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V12.Ports.Dimensions
