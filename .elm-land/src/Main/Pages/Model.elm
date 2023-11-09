module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.About
import Pages.Apps
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
import View exposing (View)


type Model
    = Home_ Pages.Home_.Model
    | About Pages.About.Model
    | Apps Pages.Apps.Model
    | Art_ExperimentChatgpt Pages.Art.ExperimentChatgpt.Model
    | Counter Pages.Counter.Model
    | Photos Pages.Photos.Model
    | Photos_NYC Pages.Photos.NYC.Model
    | Photos_Paris Pages.Photos.Paris.Model
    | Science Pages.Science.Model
    | Science_Champagne Pages.Science.Champagne.Model
    | Science_CreationAndAnnihilation Pages.Science.CreationAndAnnihilation.Model
    | Science_Entropy Pages.Science.Entropy.Model
    | NotFound_ Pages.NotFound_.Model
    | Redirecting_
    | Loading_
