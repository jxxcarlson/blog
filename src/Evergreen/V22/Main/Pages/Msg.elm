module Evergreen.V22.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V22.Pages.Home_.Msg
    | About Evergreen.V22.Pages.About.Msg
    | Apps Evergreen.V22.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V22.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V22.Pages.Counter.Msg
    | Math_Entropy Evergreen.V22.Pages.Math.Entropy.Msg
    | Photos_Paris Evergreen.V22.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V22.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V22.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V22.Pages.NotFound_.Msg
