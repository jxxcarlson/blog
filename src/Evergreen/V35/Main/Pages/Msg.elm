module Evergreen.V35.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V35.Pages.Home_.Msg
    | About Evergreen.V35.Pages.About.Msg
    | Apps Evergreen.V35.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V35.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V35.Pages.Counter.Msg
    | Photos Evergreen.V35.Pages.Photos.Msg
    | Photos_NYC Evergreen.V35.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V35.Pages.Photos.Paris.Msg
    | Science Evergreen.V35.Pages.Science.Msg
    | Science_Champagne Evergreen.V35.Pages.Science.Champagne.Msg
    | Science_Entropy Evergreen.V35.Pages.Science.Entropy.Msg
    | Science_ReasonWhy Evergreen.V35.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V35.Pages.NotFound_.Msg
