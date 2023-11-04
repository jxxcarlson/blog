module Evergreen.V4.Main.Pages.Msg exposing (..)

import Evergreen.V4.Pages.About
import Evergreen.V4.Pages.Apps
import Evergreen.V4.Pages.Counter
import Evergreen.V4.Pages.Home_
import Evergreen.V4.Pages.NotFound_
import Evergreen.V4.Pages.Photos.Paris
import Evergreen.V4.Pages.Science.Champagne
import Evergreen.V4.Pages.Science.ReasonWhy


type Msg
    = Home_ Evergreen.V4.Pages.Home_.Msg
    | About Evergreen.V4.Pages.About.Msg
    | Apps Evergreen.V4.Pages.Apps.Msg
    | Counter Evergreen.V4.Pages.Counter.Msg
    | Photos_Paris Evergreen.V4.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V4.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V4.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V4.Pages.NotFound_.Msg
