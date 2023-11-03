module Evergreen.V1.Main.Pages.Msg exposing (..)

import Evergreen.V1.Pages.About
import Evergreen.V1.Pages.Apps
import Evergreen.V1.Pages.Counter
import Evergreen.V1.Pages.Home_
import Evergreen.V1.Pages.NotFound_
import Evergreen.V1.Pages.Science.Champagne
import Evergreen.V1.Pages.Science.ReasonWhy
import Evergreen.V1.Pages.Scripta


type Msg
    = Home_ Evergreen.V1.Pages.Home_.Msg
    | About Evergreen.V1.Pages.About.Msg
    | Apps Evergreen.V1.Pages.Apps.Msg
    | Counter Evergreen.V1.Pages.Counter.Msg
    | Photos_Paris
    | Science_Champagne Evergreen.V1.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V1.Pages.Science.ReasonWhy.Msg
    | Scripta Evergreen.V1.Pages.Scripta.Msg
    | NotFound_ Evergreen.V1.Pages.NotFound_.Msg
