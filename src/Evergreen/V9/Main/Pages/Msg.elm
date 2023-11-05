module Evergreen.V9.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V9.Pages.Home_.Msg
    | About Evergreen.V9.Pages.About.Msg
    | Apps Evergreen.V9.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V9.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V9.Pages.Counter.Msg
    | Math_Entropy Evergreen.V9.Pages.Math.Entropy.Msg
    | Photos_Paris Evergreen.V9.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V9.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V9.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V9.Pages.NotFound_.Msg
