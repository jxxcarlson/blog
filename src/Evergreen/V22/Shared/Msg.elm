module Evergreen.V22.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V22.Ports
import Evergreen.V22.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V22.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V22.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
