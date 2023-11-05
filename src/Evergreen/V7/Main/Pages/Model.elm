module Evergreen.V7.Main.Pages.Model exposing (..)

import Evergreen.V7.Pages.About
import Evergreen.V7.Pages.Apps
import Evergreen.V7.Pages.Art.ExperimentChatgpt
import Evergreen.V7.Pages.Counter
import Evergreen.V7.Pages.Home_
import Evergreen.V7.Pages.NotFound_
import Evergreen.V7.Pages.Photos.Paris
import Evergreen.V7.Pages.Science.Champagne
import Evergreen.V7.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V7.Pages.Home_.Model
    | About Evergreen.V7.Pages.About.Model
    | Apps Evergreen.V7.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V7.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V7.Pages.Counter.Model
    | Photos_Paris Evergreen.V7.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V7.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V7.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V7.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
