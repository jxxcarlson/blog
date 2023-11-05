module Evergreen.V7.Shared.Msg exposing (..)

import Evergreen.V7.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V7.Render.Msg.MarkupMsg
