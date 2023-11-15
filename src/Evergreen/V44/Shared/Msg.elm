module Evergreen.V44.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V44.Ports
import Evergreen.V44.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V44.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V44.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
