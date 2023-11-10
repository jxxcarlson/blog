module Main.Pages.Msg exposing (Msg(..))

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
import Pages.Science.Champagne
import Pages.Science.CreationAndAnnihilation
import Pages.Science.Entropy
import Pages.NotFound_


type Msg
    = Home_ Pages.Home_.Msg
    | About Pages.About.Msg
    | Apps Pages.Apps.Msg
    | Apps_DrumMachine Pages.Apps.DrumMachine.Msg
    | Apps_RandomExchangeModel Pages.Apps.RandomExchangeModel.Msg
    | Art_ExperimentChatgpt Pages.Art.ExperimentChatgpt.Msg
    | Counter Pages.Counter.Msg
    | Photos Pages.Photos.Msg
    | Photos_NYC Pages.Photos.NYC.Msg
    | Photos_Paris Pages.Photos.Paris.Msg
    | Science Pages.Science.Msg
    | Science_Champagne Pages.Science.Champagne.Msg
    | Science_CreationAndAnnihilation Pages.Science.CreationAndAnnihilation.Msg
    | Science_Entropy Pages.Science.Entropy.Msg
    | NotFound_ Pages.NotFound_.Msg
