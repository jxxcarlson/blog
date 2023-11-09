module Evergreen.V31.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V31.Ports
import Evergreen.V31.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V31.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V31.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
