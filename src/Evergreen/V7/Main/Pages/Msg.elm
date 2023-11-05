module Evergreen.V7.Main.Pages.Msg exposing (..)

import Evergreen.V7.Pages.About
import Evergreen.V7.Pages.Apps
import Evergreen.V7.Pages.Art.ExperimentChatgpt
import Evergreen.V7.Pages.Counter
import Evergreen.V7.Pages.Home_
import Evergreen.V7.Pages.NotFound_
import Evergreen.V7.Pages.Photos.Paris
import Evergreen.V7.Pages.Science.Champagne
import Evergreen.V7.Pages.Science.ReasonWhy


type Msg
    = Home_ Evergreen.V7.Pages.Home_.Msg
    | About Evergreen.V7.Pages.About.Msg
    | Apps Evergreen.V7.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V7.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V7.Pages.Counter.Msg
    | Photos_Paris Evergreen.V7.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V7.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V7.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V7.Pages.NotFound_.Msg
