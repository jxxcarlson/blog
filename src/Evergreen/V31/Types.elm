module Evergreen.V31.Types exposing (..)

import Evergreen.V31.Bridge
import Evergreen.V31.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V31.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V31.Main.Msg


type alias ToBackend =
    Evergreen.V31.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
