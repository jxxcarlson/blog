module Evergreen.V2.Main.Pages.Msg exposing (..)

import Evergreen.V2.Pages.About
import Evergreen.V2.Pages.Apps
import Evergreen.V2.Pages.Counter
import Evergreen.V2.Pages.Home_
import Evergreen.V2.Pages.NotFound_
import Evergreen.V2.Pages.Scripta


type Msg
    = Home_ Evergreen.V2.Pages.Home_.Msg
    | About Evergreen.V2.Pages.About.Msg
    | Apps Evergreen.V2.Pages.Apps.Msg
    | Counter Evergreen.V2.Pages.Counter.Msg
    | Photos_Paris
    | Scripta Evergreen.V2.Pages.Scripta.Msg
    | NotFound_ Evergreen.V2.Pages.NotFound_.Msg
