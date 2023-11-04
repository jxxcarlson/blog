module Evergreen.V3.Main.Pages.Msg exposing (..)

import Evergreen.V3.Pages.About
import Evergreen.V3.Pages.Apps
import Evergreen.V3.Pages.Counter
import Evergreen.V3.Pages.Home_
import Evergreen.V3.Pages.NotFound_
import Evergreen.V3.Pages.Photos.Paris
import Evergreen.V3.Pages.Science.Champagne
import Evergreen.V3.Pages.Science.ReasonWhy
import Evergreen.V3.Pages.Scripta


type Msg
    = Home_ Evergreen.V3.Pages.Home_.Msg
    | About Evergreen.V3.Pages.About.Msg
    | Apps Evergreen.V3.Pages.Apps.Msg
    | Counter Evergreen.V3.Pages.Counter.Msg
    | Photos_Paris Evergreen.V3.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V3.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V3.Pages.Science.ReasonWhy.Msg
    | Scripta Evergreen.V3.Pages.Scripta.Msg
    | NotFound_ Evergreen.V3.Pages.NotFound_.Msg
