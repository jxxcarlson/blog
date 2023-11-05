module Evergreen.V9.Shared.Msg exposing (..)

import Evergreen.V9.Render.Msg


type Msg
    = GotNewSmashedLikes Int
    | WindowResized Int Int
    | Render Evergreen.V9.Render.Msg.MarkupMsg
