module Evergreen.V9.Main.Pages.Model exposing (..)

import Evergreen.V9.Pages.About
import Evergreen.V9.Pages.Apps
import Evergreen.V9.Pages.Art.ExperimentChatgpt
import Evergreen.V9.Pages.Counter
import Evergreen.V9.Pages.Home_
import Evergreen.V9.Pages.Math.Entropy
import Evergreen.V9.Pages.NotFound_
import Evergreen.V9.Pages.Photos.Paris
import Evergreen.V9.Pages.Science.Champagne
import Evergreen.V9.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V9.Pages.Home_.Model
    | About Evergreen.V9.Pages.About.Model
    | Apps Evergreen.V9.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V9.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V9.Pages.Counter.Model
    | Math_Entropy Evergreen.V9.Pages.Math.Entropy.Model
    | Photos_Paris Evergreen.V9.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V9.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V9.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V9.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
