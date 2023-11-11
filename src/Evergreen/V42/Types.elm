module Evergreen.V42.Types exposing (..)

import Evergreen.V42.Bridge
import Evergreen.V42.Main
import Lamdera


type alias FrontendModel =
    Evergreen.V42.Main.Model


type alias BackendModel =
    { smashedLikes : Int
    }


type alias FrontendMsg =
    Evergreen.V42.Main.Msg


type alias ToBackend =
    Evergreen.V42.Bridge.ToBackend


type BackendMsg
    = OnConnect Lamdera.SessionId Lamdera.ClientId


type ToFrontend
    = NewSmashedLikes Int
