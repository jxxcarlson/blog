module Evergreen.V1.Main.Pages.Model exposing (..)

import Evergreen.V1.Pages.About
import Evergreen.V1.Pages.Apps
import Evergreen.V1.Pages.Counter
import Evergreen.V1.Pages.Home_
import Evergreen.V1.Pages.NotFound_
import Evergreen.V1.Pages.Science.Champagne
import Evergreen.V1.Pages.Science.ReasonWhy
import Evergreen.V1.Pages.Scripta


type Model
    = Home_ Evergreen.V1.Pages.Home_.Model
    | About Evergreen.V1.Pages.About.Model
    | Apps Evergreen.V1.Pages.Apps.Model
    | Counter Evergreen.V1.Pages.Counter.Model
    | Photos_Paris
    | Science_Champagne Evergreen.V1.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V1.Pages.Science.ReasonWhy.Model
    | Scripta Evergreen.V1.Pages.Scripta.Model
    | NotFound_ Evergreen.V1.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
