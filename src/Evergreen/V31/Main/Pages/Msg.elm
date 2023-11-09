module Evergreen.V31.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V31.Pages.Home_.Msg
    | About Evergreen.V31.Pages.About.Msg
    | Apps Evergreen.V31.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V31.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V31.Pages.Counter.Msg
    | Math_Entropy Evergreen.V31.Pages.Math.Entropy.Msg
    | Photos Evergreen.V31.Pages.Photos.Msg
    | Photos_NYC Evergreen.V31.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V31.Pages.Photos.Paris.Msg
    | Science_Champagne Evergreen.V31.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V31.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V31.Pages.NotFound_.Msg
