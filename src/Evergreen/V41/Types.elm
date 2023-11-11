module Evergreen.V41.Types exposing (..)

import Evergreen.V41.Bridge
import Evergreen.V41.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V41.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V41.Main.Msg


type alias ToBackend =
    Evergreen.V41.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
