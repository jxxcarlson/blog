module Evergreen.V44.Types exposing (..)

import Evergreen.V44.Bridge
import Evergreen.V44.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V44.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V44.Main.Msg


type alias ToBackend =
    Evergreen.V44.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
