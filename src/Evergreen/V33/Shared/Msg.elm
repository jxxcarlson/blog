module Evergreen.V33.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V33.Ports
import Evergreen.V33.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V33.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V33.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
