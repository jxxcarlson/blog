module Evergreen.V35.Types exposing (..)

import Evergreen.V35.Bridge
import Evergreen.V35.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V35.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V35.Main.Msg


type alias ToBackend =
    Evergreen.V35.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
