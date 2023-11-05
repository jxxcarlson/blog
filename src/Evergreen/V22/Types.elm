module Evergreen.V22.Types exposing (..)

import Evergreen.V22.Bridge
import Evergreen.V22.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V22.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V22.Main.Msg


type alias ToBackend =
    Evergreen.V22.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
