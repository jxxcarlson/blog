module Evergreen.V37.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V37.Ports
import Evergreen.V37.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V37.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V37.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
