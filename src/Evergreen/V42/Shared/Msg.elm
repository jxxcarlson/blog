module Evergreen.V42.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V42.Ports
import Evergreen.V42.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V42.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V42.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
