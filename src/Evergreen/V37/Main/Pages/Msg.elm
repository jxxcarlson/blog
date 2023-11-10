module Evergreen.V37.Main.Pages.Msg exposing (..)

import Evergreen.V37.Pages.About
import Evergreen.V37.Pages.Apps
import Evergreen.V37.Pages.Apps.DrumMachine
import Evergreen.V37.Pages.Apps.RandomExchangeModel
import Evergreen.V37.Pages.Art.ExperimentChatgpt
import Evergreen.V37.Pages.Counter
import Evergreen.V37.Pages.Home_
import Evergreen.V37.Pages.NotFound_
import Evergreen.V37.Pages.Photos
import Evergreen.V37.Pages.Photos.NYC
import Evergreen.V37.Pages.Photos.Paris
import Evergreen.V37.Pages.Science
import Evergreen.V37.Pages.Science.Champagne
import Evergreen.V37.Pages.Science.CreationAndAnnihilation
import Evergreen.V37.Pages.Science.Entropy


type Msg
    = Home_ Evergreen.V37.Pages.Home_.Msg
    | About Evergreen.V37.Pages.About.Msg
    | Apps Evergreen.V37.Pages.Apps.Msg
    | Apps_DrumMachine Evergreen.V37.Pages.Apps.DrumMachine.Msg
    | Apps_RandomExchangeModel Evergreen.V37.Pages.Apps.RandomExchangeModel.Msg
    | Art_ExperimentChatgpt Evergreen.V37.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V37.Pages.Counter.Msg
    | Photos Evergreen.V37.Pages.Photos.Msg
    | Photos_NYC Evergreen.V37.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V37.Pages.Photos.Paris.Msg
    | Science Evergreen.V37.Pages.Science.Msg
    | Science_Champagne Evergreen.V37.Pages.Science.Champagne.Msg
    | Science_CreationAndAnnihilation Evergreen.V37.Pages.Science.CreationAndAnnihilation.Msg
    | Science_Entropy Evergreen.V37.Pages.Science.Entropy.Msg
    | NotFound_ Evergreen.V37.Pages.NotFound_.Msg
