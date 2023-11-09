module Evergreen.V33.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V33.Pages.Home_.Msg
    | About Evergreen.V33.Pages.About.Msg
    | Apps Evergreen.V33.Pages.Apps.Msg
    | Art_ExperimentChatgpt Evergreen.V33.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V33.Pages.Counter.Msg
    | Math_Entropy Evergreen.V33.Pages.Math.Entropy.Msg
    | Photos Evergreen.V33.Pages.Photos.Msg
    | Photos_NYC Evergreen.V33.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V33.Pages.Photos.Paris.Msg
    | Science Evergreen.V33.Pages.Science.Msg
    | Science_Champagne Evergreen.V33.Pages.Science.Champagne.Msg
    | Science_ReasonWhy Evergreen.V33.Pages.Science.ReasonWhy.Msg
    | NotFound_ Evergreen.V33.Pages.NotFound_.Msg
