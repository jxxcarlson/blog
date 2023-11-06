module Evergreen.V26.Main.Pages.Model exposing (..)

import Evergreen.V26.Pages.About
import Evergreen.V26.Pages.Apps
import Evergreen.V26.Pages.Art.ExperimentChatgpt
import Evergreen.V26.Pages.Counter
import Evergreen.V26.Pages.Home_
import Evergreen.V26.Pages.Math.Entropy
import Evergreen.V26.Pages.NotFound_
import Evergreen.V26.Pages.Photos.NYC
import Evergreen.V26.Pages.Photos.Paris
import Evergreen.V26.Pages.Science.Champagne
import Evergreen.V26.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V26.Pages.Home_.Model
    | About Evergreen.V26.Pages.About.Model
    | Apps Evergreen.V26.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V26.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V26.Pages.Counter.Model
    | Math_Entropy Evergreen.V26.Pages.Math.Entropy.Model
    | Photos_NYC Evergreen.V26.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V26.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V26.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V26.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V26.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
