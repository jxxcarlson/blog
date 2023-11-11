module Evergreen.V42.Main.Pages.Model exposing (..)

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


type Model
    = Home_ Evergreen.V42.Pages.Home_.Model
    | About Evergreen.V42.Pages.About.Model
    | Apps Evergreen.V42.Pages.Apps.Model
    | Apps_DrumMachine Evergreen.V42.Pages.Apps.DrumMachine.Model
    | Apps_RandomExchangeModel Evergreen.V42.Pages.Apps.RandomExchangeModel.Model
    | Art_ExperimentChatgpt Evergreen.V42.Pages.Art.ExperimentChatgpt.Model
    | Counter Evergreen.V42.Pages.Counter.Model
    | Photos Evergreen.V42.Pages.Photos.Model
    | Photos_NYC Evergreen.V42.Pages.Photos.NYC.Model
    | Photos_Paris Evergreen.V42.Pages.Photos.Paris.Model
    | Science Evergreen.V42.Pages.Science.Model
    | Science_Atoms Evergreen.V42.Pages.Science.Atoms.Model
    | Science_Champagne Evergreen.V42.Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Evergreen.V42.Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Evergreen.V42.Pages.Science.Entropy.Model
    | Science_IdeaOfAtom Evergreen.V42.Pages.Science.IdeaOfAtom.Model
    | Science_Neutrino Evergreen.V42.Pages.Science.Neutrino.Model
    | Science_OldestTree Evergreen.V42.Pages.Science.OldestTree.Model
    | NotFound_ Evergreen.V42.Pages.NotFound_.Model
    | Redirecting_
    | Loading_
