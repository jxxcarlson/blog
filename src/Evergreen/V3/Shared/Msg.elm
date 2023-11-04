module Evergreen.V3.Shared.Msg exposing (..)

import Evergreen.V3.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V3.Render.Msg.MarkupMsg
