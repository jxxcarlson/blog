module Evergreen.V26.Types exposing (..)

import Evergreen.V26.Bridge
import Evergreen.V26.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V26.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V26.Main.Msg


type alias ToBackend =
    Evergreen.V26.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
