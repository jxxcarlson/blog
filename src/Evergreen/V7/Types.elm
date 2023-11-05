module Evergreen.V7.Types exposing (..)

import Evergreen.V7.Bridge
import Evergreen.V7.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V7.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V7.Main.Msg


type alias ToBackend =
    Evergreen.V7.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
