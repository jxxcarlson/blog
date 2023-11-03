module Evergreen.V3.Main.Pages.Model exposing (..)

import Evergreen.V3.Pages.About
import Evergreen.V3.Pages.Apps
import Evergreen.V3.Pages.Counter
import Evergreen.V3.Pages.Home_
import Evergreen.V3.Pages.NotFound_
import Evergreen.V3.Pages.Scripta


type Model
    = Home_ Evergreen.V3.Pages.Home_.Model
    | About Evergreen.V3.Pages.About.Model
    | Apps Evergreen.V3.Pages.Apps.Model
    | Counter Evergreen.V3.Pages.Counter.Model
    | Photos_Paris
    | Science_Champagne
    | Scripta Evergreen.V3.Pages.Scripta.Model
    | NotFound_ Evergreen.V3.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
