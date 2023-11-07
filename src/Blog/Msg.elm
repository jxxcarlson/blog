module Blog.Msg exposing (Msg(..))

import Render.Msg exposing (MarkupMsg)


type Msg
    = Render MarkupMsg
