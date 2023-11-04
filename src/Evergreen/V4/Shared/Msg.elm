module Evergreen.V4.Shared.Msg exposing (..)

import Evergreen.V4.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V4.Render.Msg.MarkupMsg
