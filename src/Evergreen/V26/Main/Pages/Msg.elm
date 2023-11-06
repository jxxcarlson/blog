module Evergreen.V26.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V26.Pages.Home_.Msg
    | About Evergreen.V26.Pages.About.Msg
    | Apps Evergreen.V26.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V26.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V26.Pages.Counter.Msg
    | Math_Entropy Evergreen.V26.Pages.Math.Entropy.Msg
    | Photos_NYC Evergreen.V26.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V26.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V26.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V26.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V26.Pages.NotFound_.Msg
