module Evergreen.V41.Main.Pages.Msg exposing (..)

import Evergreen.V41.Pages.About
import Evergreen.V41.Pages.Apps
import Evergreen.V41.Pages.Apps.DrumMachine
import Evergreen.V41.Pages.Apps.RandomExchangeModel
import Evergreen.V41.Pages.Art.ExperimentChatgpt
import Evergreen.V41.Pages.Counter
import Evergreen.V41.Pages.Home_
import Evergreen.V41.Pages.NotFound_
import Evergreen.V41.Pages.Photos
import Evergreen.V41.Pages.Photos.NYC
import Evergreen.V41.Pages.Photos.Paris
import Evergreen.V41.Pages.Science
import Evergreen.V41.Pages.Science.Atoms
import Evergreen.V41.Pages.Science.Champagne
import Evergreen.V41.Pages.Science.CreationAndAnnihilation
import Evergreen.V41.Pages.Science.Entropy
import Evergreen.V41.Pages.Science.Neutrino
import Evergreen.V41.Pages.Science.OldestTree


type Msg
    = Home_ Evergreen.V41.Pages.Home_.Msg
    | About Evergreen.V41.Pages.About.Msg
    | Apps Evergreen.V41.Pages.Apps.Msg
    | Apps_DrumMachine Evergreen.V41.Pages.Apps.DrumMachine.Msg
    | Apps_RandomExchangeModel Evergreen.V41.Pages.Apps.RandomExchangeModel.Msg
    | Art_ExperimentChatgpt Evergreen.V41.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V41.Pages.Counter.Msg
    | Photos Evergreen.V41.Pages.Photos.Msg
    | Photos_NYC Evergreen.V41.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V41.Pages.Photos.Paris.Msg
    | Science Evergreen.V41.Pages.Science.Msg
    | Science_Atoms Evergreen.V41.Pages.Science.Atoms.Msg
    | Science_Champagne Evergreen.V41.Pages.Science.Champagne.Msg
    | Science_CreationAndAnnihilation Evergreen.V41.Pages.Science.CreationAndAnnihilation.Msg
    | Science_Entropy Evergreen.V41.Pages.Science.Entropy.Msg
    | Science_Neutrino Evergreen.V41.Pages.Science.Neutrino.Msg
    | Science_OldestTree Evergreen.V41.Pages.Science.OldestTree.Msg
    | NotFound_ Evergreen.V41.Pages.NotFound_.Msg
