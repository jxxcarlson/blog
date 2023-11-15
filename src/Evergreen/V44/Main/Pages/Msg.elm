module Evergreen.V44.Main.Pages.Msg exposing (..)

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


type Msg
    = Home_ Evergreen.V44.Pages.Home_.Msg
    | About Evergreen.V44.Pages.About.Msg
    | Apps Evergreen.V44.Pages.Apps.Msg
    | Apps_DrumMachine Evergreen.V44.Pages.Apps.DrumMachine.Msg
    | Apps_RandomExchangeModel Evergreen.V44.Pages.Apps.RandomExchangeModel.Msg
    | Art_ExperimentChatgpt Evergreen.V44.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V44.Pages.Counter.Msg
    | Photos Evergreen.V44.Pages.Photos.Msg
    | Photos_NYC Evergreen.V44.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V44.Pages.Photos.Paris.Msg
    | Science Evergreen.V44.Pages.Science.Msg
    | Science_Atoms Evergreen.V44.Pages.Science.Atoms.Msg
    | Science_Champagne Evergreen.V44.Pages.Science.Champagne.Msg
    | Science_CreationAndAnnihilation Evergreen.V44.Pages.Science.CreationAndAnnihilation.Msg
    | Science_Entropy Evergreen.V44.Pages.Science.Entropy.Msg
    | Science_IdeaOfAtom Evergreen.V44.Pages.Science.IdeaOfAtom.Msg
    | Science_Neutrino Evergreen.V44.Pages.Science.Neutrino.Msg
    | Science_OldestTree Evergreen.V44.Pages.Science.OldestTree.Msg
    | Science_PeriodicTable
    | NotFound_ Evergreen.V44.Pages.NotFound_.Msg
