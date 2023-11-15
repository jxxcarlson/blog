module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Apps.DrumMachine
import Pages.Apps.RandomExchangeModel
import Pages.Art.ExperimentChatgpt
import Pages.Counter
import Pages.Photos
import Pages.Photos.NYC
import Pages.Photos.Paris
import Pages.Science
import Pages.Science.Atoms
import Pages.Science.Champagne
import Pages.Science.CreationAndAnnihilation
import Pages.Science.Entropy
import Pages.Science.IdeaOfAtom
import Pages.Science.Neutrino
import Pages.Science.OldestTree
import Pages.Science.PeriodicTable
import Pages.NotFound_
import View exposing (View)


type Model
    = Home_ Pages.Home_.Model
    | About Pages.About.Model
    | Apps Pages.Apps.Model
    | Apps_DrumMachine Pages.Apps.DrumMachine.Model
    | Apps_RandomExchangeModel Pages.Apps.RandomExchangeModel.Model
    | Art_ExperimentChatgpt Pages.Art.ExperimentChatgpt.Model
    | Counter Pages.Counter.Model
    | Photos Pages.Photos.Model
    | Photos_NYC Pages.Photos.NYC.Model
    | Photos_Paris Pages.Photos.Paris.Model
    | Science Pages.Science.Model
    | Science_Atoms Pages.Science.Atoms.Model
    | Science_Champagne Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Pages.Science.Entropy.Model
    | Science_IdeaOfAtom Pages.Science.IdeaOfAtom.Model
    | Science_Neutrino Pages.Science.Neutrino.Model
    | Science_OldestTree Pages.Science.OldestTree.Model
    | Science_PeriodicTable
    | NotFound_ Pages.NotFound_.Model
    | Redirecting_
    | Loading_
