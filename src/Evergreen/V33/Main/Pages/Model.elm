module Evergreen.V33.Main.Pages.Model exposing (..)

import Evergreen.V33.Pages.About
import Evergreen.V33.Pages.Apps
import Evergreen.V33.Pages.Art.ExperimentChatgpt
import Evergreen.V33.Pages.Counter
import Evergreen.V33.Pages.Home_
import Evergreen.V33.Pages.Math.Entropy
import Evergreen.V33.Pages.NotFound_
import Evergreen.V33.Pages.Photos
import Evergreen.V33.Pages.Photos.NYC
import Evergreen.V33.Pages.Photos.Paris
import Evergreen.V33.Pages.Science
import Evergreen.V33.Pages.Science.Champagne
import Evergreen.V33.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V33.Pages.Home_.Model
    | About Evergreen.V33.Pages.About.Model
    | Apps Evergreen.V33.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V33.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V33.Pages.Counter.Model
    | Math_Entropy Evergreen.V33.Pages.Math.Entropy.Model
    | Photos Evergreen.V33.Pages.Photos.Model
    | Photos_NYC Evergreen.V33.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V33.Pages.Photos.Paris.Model
    | Science Evergreen.V33.Pages.Science.Model
    | Science_Champagne Evergreen.V33.Pages.Science.Champagne.Model
    | Science_ReasonWhy Evergreen.V33.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V33.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
