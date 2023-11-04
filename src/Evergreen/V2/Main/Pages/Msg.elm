module Evergreen.V2.Main.Pages.Msg exposing (..)

import Evergreen.V2.Pages.About
import Evergreen.V2.Pages.Apps
import Evergreen.V2.Pages.Counter
import Evergreen.V2.Pages.Home_
import Evergreen.V2.Pages.NotFound_
import Evergreen.V2.Pages.Science.Champagne
import Evergreen.V2.Pages.Science.ReasonWhy
import Evergreen.V2.Pages.Scripta


type Msg
    = Home_ Evergreen.V2.Pages.Home_.Msg
    | About Evergreen.V2.Pages.About.Msg
    | Apps Evergreen.V2.Pages.Apps.Msg
    | Counter Evergreen.V2.Pages.Counter.Msg
    | Photos_Paris
    | Science_Champagne Evergreen.V2.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V2.Pages.Science.ReasonWhy.Msg
    | Scripta Evergreen.V2.Pages.Scripta.Msg
    | NotFound_ Evergreen.V2.Pages.NotFound_.Msg
