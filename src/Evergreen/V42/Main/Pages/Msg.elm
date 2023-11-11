module Evergreen.V42.Main.Pages.Msg exposing (..)

import Evergreen.V42.Pages.About
import Evergreen.V42.Pages.Apps
import Evergreen.V42.Pages.Apps.DrumMachine
import Evergreen.V42.Pages.Apps.RandomExchangeModel
import Evergreen.V42.Pages.Art.ExperimentChatgpt
import Evergreen.V42.Pages.Counter
import Evergreen.V42.Pages.Home_
import Evergreen.V42.Pages.NotFound_
import Evergreen.V42.Pages.Photos
import Evergreen.V42.Pages.Photos.NYC
import Evergreen.V42.Pages.Photos.Paris
import Evergreen.V42.Pages.Science
import Evergreen.V42.Pages.Science.Atoms
import Evergreen.V42.Pages.Science.Champagne
import Evergreen.V42.Pages.Science.CreationAndAnnihilation
import Evergreen.V42.Pages.Science.Entropy
import Evergreen.V42.Pages.Science.IdeaOfAtom
import Evergreen.V42.Pages.Science.Neutrino
import Evergreen.V42.Pages.Science.OldestTree


type Msg
    = Home_ Evergreen.V42.Pages.Home_.Msg
    | About Evergreen.V42.Pages.About.Msg
    | Apps Evergreen.V42.Pages.Apps.Msg
    | Apps_DrumMachine Evergreen.V42.Pages.Apps.DrumMachine.Msg
    | Apps_RandomExchangeModel Evergreen.V42.Pages.Apps.RandomExchangeModel.Msg
    | Art_ExperimentChatgpt Evergreen.V42.Pages.Art.ExperimentChatgpt.Msg
    | Counter Evergreen.V42.Pages.Counter.Msg
    | Photos Evergreen.V42.Pages.Photos.Msg
    | Photos_NYC Evergreen.V42.Pages.Photos.NYC.Msg
    | Photos_Paris Evergreen.V42.Pages.Photos.Paris.Msg
    | Science Evergreen.V42.Pages.Science.Msg
    | Science_Atoms Evergreen.V42.Pages.Science.Atoms.Msg
    | Science_Champagne Evergreen.V42.Pages.Science.Champagne.Msg
    | Science_CreationAndAnnihilation Evergreen.V42.Pages.Science.CreationAndAnnihilation.Msg
    | Science_Entropy Evergreen.V42.Pages.Science.Entropy.Msg
    | Science_IdeaOfAtom Evergreen.V42.Pages.Science.IdeaOfAtom.Msg
    | Science_Neutrino Evergreen.V42.Pages.Science.Neutrino.Msg
    | Science_OldestTree Evergreen.V42.Pages.Science.OldestTree.Msg
    | NotFound_ Evergreen.V42.Pages.NotFound_.Msg
