module Evergreen.V35.Shared.Msg exposing (..)

import Browser.Dom
import Evergreen.V35.Ports
import Evergreen.V35.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V35.Render.Msg.MarkupMsg
    | DimensionsChanged Evergreen.V35.Ports.Dimensions
    | GotViewport Browser.Dom.Viewport
