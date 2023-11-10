module Evergreen.V37.Types exposing (..)

import Evergreen.V37.Bridge
import Evergreen.V37.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V37.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V37.Main.Msg


type alias ToBackend =
    Evergreen.V37.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
