module Evergreen.V41.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V41.Ports
import Evergreen.V41.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V41.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V41.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
