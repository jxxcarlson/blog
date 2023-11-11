module Evergreen.V41.Main.Pages.Model exposing (..)

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


type Model
    = Home_ Evergreen.V41.Pages.Home_.Model
    | About Evergreen.V41.Pages.About.Model
    | Apps Evergreen.V41.Pages.Apps.Model
    | Apps_DrumMachine Evergreen.V41.Pages.Apps.DrumMachine.Model
    | Apps_RandomExchangeModel Evergreen.V41.Pages.Apps.RandomExchangeModel.Model
    | Art_ExperimentChatgpt Evergreen.V41.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V41.Pages.Counter.Model
    | Photos Evergreen.V41.Pages.Photos.Model
    | Photos_NYC Evergreen.V41.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V41.Pages.Photos.Paris.Model
    | Science Evergreen.V41.Pages.Science.Model
    | Science_Atoms Evergreen.V41.Pages.Science.Atoms.Model
    | Science_Champagne Evergreen.V41.Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Evergreen.V41.Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Evergreen.V41.Pages.Science.Entropy.Model
    | Science_Neutrino Evergreen.V41.Pages.Science.Neutrino.Model
    | Science_OldestTree Evergreen.V41.Pages.Science.OldestTree.Model
    | NotFound_ Evergreen.V41.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
