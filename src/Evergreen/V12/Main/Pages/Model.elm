module Evergreen.V12.Main.Pages.Model exposing (..)

import Evergreen.V12.Pages.About
import Evergreen.V12.Pages.Apps
import Evergreen.V12.Pages.Art.ExperimentChatgpt
import Evergreen.V12.Pages.Counter
import Evergreen.V12.Pages.Home_
import Evergreen.V12.Pages.Math.Entropy
import Evergreen.V12.Pages.NotFound_
import Evergreen.V12.Pages.Photos.Paris
import Evergreen.V12.Pages.Science.Champagne
import Evergreen.V12.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V12.Pages.Home_.Model
    | About Evergreen.V12.Pages.About.Model
    | Apps Evergreen.V12.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V12.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V12.Pages.Counter.Model
    | Math_Entropy Evergreen.V12.Pages.Math.Entropy.Model
    | Photos_Paris Evergreen.V12.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V12.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V12.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V12.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
