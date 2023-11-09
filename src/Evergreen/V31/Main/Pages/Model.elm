module Evergreen.V31.Main.Pages.Model exposing (..)

import Evergreen.V31.Pages.About
import Evergreen.V31.Pages.Apps
import Evergreen.V31.Pages.Art.ExperimentChatgpt
import Evergreen.V31.Pages.Counter
import Evergreen.V31.Pages.Home_
import Evergreen.V31.Pages.Math.Entropy
import Evergreen.V31.Pages.NotFound_
import Evergreen.V31.Pages.Photos
import Evergreen.V31.Pages.Photos.NYC
import Evergreen.V31.Pages.Photos.Paris
import Evergreen.V31.Pages.Science.Champagne
import Evergreen.V31.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V31.Pages.Home_.Model
    | About Evergreen.V31.Pages.About.Model
    | Apps Evergreen.V31.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V31.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V31.Pages.Counter.Model
    | Math_Entropy Evergreen.V31.Pages.Math.Entropy.Model
    | Photos Evergreen.V31.Pages.Photos.Model
    | Photos_NYC Evergreen.V31.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V31.Pages.Photos.Paris.Model
    | Science_Champagne Evergreen.V31.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V31.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V31.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
