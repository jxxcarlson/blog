module Evergreen.V12.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V12.Pages.Home_.Msg
    | About Evergreen.V12.Pages.About.Msg
    | Apps Evergreen.V12.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V12.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V12.Pages.Counter.Msg
    | Math_Entropy Evergreen.V12.Pages.Math.Entropy.Msg
    | Photos_Paris Evergreen.V12.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V12.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V12.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V12.Pages.NotFound_.Msg
