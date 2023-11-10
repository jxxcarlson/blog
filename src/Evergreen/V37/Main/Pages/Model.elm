module Evergreen.V37.Main.Pages.Model exposing (..)

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


type Model
    = Home_ Evergreen.V37.Pages.Home_.Model
    | About Evergreen.V37.Pages.About.Model
    | Apps Evergreen.V37.Pages.Apps.Model
    | Apps_DrumMachine Evergreen.V37.Pages.Apps.DrumMachine.Model
    | Apps_RandomExchangeModel Evergreen.V37.Pages.Apps.RandomExchangeModel.Model
    | Art_ExperimentChatgpt Evergreen.V37.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V37.Pages.Counter.Model
    | Photos Evergreen.V37.Pages.Photos.Model
    | Photos_NYC Evergreen.V37.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V37.Pages.Photos.Paris.Model
    | Science Evergreen.V37.Pages.Science.Model
    | Science_Champagne Evergreen.V37.Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Evergreen.V37.Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Evergreen.V37.Pages.Science.Entropy.Model
    | NotFound_ Evergreen.V37.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
