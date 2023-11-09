module Evergreen.V33.Types exposing (..)

import Evergreen.V33.Bridge
import Evergreen.V33.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V33.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V33.Main.Msg


type alias ToBackend =
    Evergreen.V33.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
