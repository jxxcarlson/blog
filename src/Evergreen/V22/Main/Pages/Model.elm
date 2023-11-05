module Evergreen.V22.Main.Pages.Model exposing (..)

import Evergreen.V22.Pages.About
import Evergreen.V22.Pages.Apps
import Evergreen.V22.Pages.Art.ExperimentChatgpt
import Evergreen.V22.Pages.Counter
import Evergreen.V22.Pages.Home_
import Evergreen.V22.Pages.Math.Entropy
import Evergreen.V22.Pages.NotFound_
import Evergreen.V22.Pages.Photos.Paris
import Evergreen.V22.Pages.Science.Champagne
import Evergreen.V22.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V22.Pages.Home_.Model
    | About Evergreen.V22.Pages.About.Model
    | Apps Evergreen.V22.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V22.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V22.Pages.Counter.Model
    | Math_Entropy Evergreen.V22.Pages.Math.Entropy.Model
    | Photos_Paris Evergreen.V22.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V22.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V22.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V22.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
