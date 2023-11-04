module Evergreen.V4.Types exposing (..)

import Evergreen.V4.Bridge
import Evergreen.V4.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V4.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V4.Main.Msg


type alias ToBackend =
    Evergreen.V4.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
