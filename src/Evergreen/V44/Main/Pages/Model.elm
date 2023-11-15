module Evergreen.V44.Main.Pages.Model exposing (..)

import Evergreen.V44.Pages.About
import Evergreen.V44.Pages.Apps
import Evergreen.V44.Pages.Apps.DrumMachine
import Evergreen.V44.Pages.Apps.RandomExchangeModel
import Evergreen.V44.Pages.Art.ExperimentChatgpt
import Evergreen.V44.Pages.Counter
import Evergreen.V44.Pages.Home_
import Evergreen.V44.Pages.NotFound_
import Evergreen.V44.Pages.Photos
import Evergreen.V44.Pages.Photos.NYC
import Evergreen.V44.Pages.Photos.Paris
import Evergreen.V44.Pages.Science
import Evergreen.V44.Pages.Science.Atoms
import Evergreen.V44.Pages.Science.Champagne
import Evergreen.V44.Pages.Science.CreationAndAnnihilation
import Evergreen.V44.Pages.Science.Entropy
import Evergreen.V44.Pages.Science.IdeaOfAtom
import Evergreen.V44.Pages.Science.Neutrino
import Evergreen.V44.Pages.Science.OldestTree


type Model
    = Home_ Evergreen.V44.Pages.Home_.Model
    | About Evergreen.V44.Pages.About.Model
    | Apps Evergreen.V44.Pages.Apps.Model
    | Apps_DrumMachine Evergreen.V44.Pages.Apps.DrumMachine.Model
    | Apps_RandomExchangeModel Evergreen.V44.Pages.Apps.RandomExchangeModel.Model
    | Art_ExperimentChatgpt Evergreen.V44.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V44.Pages.Counter.Model
    | Photos Evergreen.V44.Pages.Photos.Model
    | Photos_NYC Evergreen.V44.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V44.Pages.Photos.Paris.Model
    | Science Evergreen.V44.Pages.Science.Model
    | Science_Atoms Evergreen.V44.Pages.Science.Atoms.Model
    | Science_Champagne Evergreen.V44.Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Evergreen.V44.Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Evergreen.V44.Pages.Science.Entropy.Model
    | Science_IdeaOfAtom Evergreen.V44.Pages.Science.IdeaOfAtom.Model
    | Science_Neutrino Evergreen.V44.Pages.Science.Neutrino.Model
    | Science_OldestTree Evergreen.V44.Pages.Science.OldestTree.Model
    | Science_PeriodicTable
    | NotFound_ Evergreen.V44.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
