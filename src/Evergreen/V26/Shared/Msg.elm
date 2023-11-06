module Evergreen.V26.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V26.Ports
import Evergreen.V26.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V26.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V26.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
