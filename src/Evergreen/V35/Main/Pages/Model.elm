module Evergreen.V35.Main.Pages.Model exposing (..)

import Evergreen.V35.Pages.About
import Evergreen.V35.Pages.Apps
import Evergreen.V35.Pages.Art.ExperimentChatgpt
import Evergreen.V35.Pages.Counter
import Evergreen.V35.Pages.Home_
import Evergreen.V35.Pages.NotFound_
import Evergreen.V35.Pages.Photos
import Evergreen.V35.Pages.Photos.NYC
import Evergreen.V35.Pages.Photos.Paris
import Evergreen.V35.Pages.Science
import Evergreen.V35.Pages.Science.Champagne
import Evergreen.V35.Pages.Science.Entropy
import Evergreen.V35.Pages.Science.ReasonWhy


type Model
    = Home_ Evergreen.V35.Pages.Home_.Model
    | About Evergreen.V35.Pages.About.Model
    | Apps Evergreen.V35.Pages.Apps.Model
    | Art_ExperimentChatgpt Evergreen.V35.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V35.Pages.Counter.Model
    | Photos Evergreen.V35.Pages.Photos.Model
    | Photos_NYC Evergreen.V35.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V35.Pages.Photos.Paris.Model
    | Science Evergreen.V35.Pages.Science.Model
    | Science_Champagne Evergreen.V35.Pages.Science.Champagne.Model
    | Science_Entropy Evergreen.V35.Pages.Science.Entropy.Model
    | Science_ReasonWhy Evergreen.V35.Pages.Science.ReasonWhy.Model
    | NotFound_ Evergreen.V35.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
