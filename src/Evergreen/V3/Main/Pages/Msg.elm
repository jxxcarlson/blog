module Evergreen.V3.Main.Pages.Msg exposing (..)

import Evergreen.V3.Pages.About
import Evergreen.V3.Pages.Apps
import Evergreen.V3.Pages.Counter
import Evergreen.V3.Pages.Home_
import Evergreen.V3.Pages.NotFound_
import Evergreen.V3.Pages.Scripta


type Msg
    = Home_ Evergreen.V3.Pages.Home_.Msg
    | About Evergreen.V3.Pages.About.Msg
    | Apps Evergreen.V3.Pages.Apps.Msg
    | Counter Evergreen.V3.Pages.Counter.Msg
    | Photos_Paris
    | Science_Champagne
    | Scripta Evergreen.V3.Pages.Scripta.Msg
    | NotFound_ Evergreen.V3.Pages.NotFound_.Msg
