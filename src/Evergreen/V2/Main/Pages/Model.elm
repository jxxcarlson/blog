module Evergreen.V2.Main.Pages.Model exposing (..)

import Evergreen.V2.Pages.About
import Evergreen.V2.Pages.Apps
import Evergreen.V2.Pages.Counter
import Evergreen.V2.Pages.Home_
import Evergreen.V2.Pages.NotFound_
import Evergreen.V2.Pages.Scripta


type Model
    = Home_ Evergreen.V2.Pages.Home_.Model
    | About Evergreen.V2.Pages.About.Model
    | Apps Evergreen.V2.Pages.Apps.Model
    | Counter Evergreen.V2.Pages.Counter.Model
    | Photos_Paris
    | Scripta Evergreen.V2.Pages.Scripta.Model
    | NotFound_ Evergreen.V2.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
