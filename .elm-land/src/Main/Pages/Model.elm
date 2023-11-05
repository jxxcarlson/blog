module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Art.ExperimentChatgpt
import Pages.Counter
import Pages.Math.Entropy
import Pages.Photos.Paris
import Pages.Science.Champagne
import Pages.Science.ReasonWhy
import Pages.NotFound_
import View exposing (View)


type Model
    = Home_ Pages.Home_.Model
    | About Pages.About.Model
    | Apps Pages.Apps.Model
    | Art_ExperimentChatgpt Pages.Art.ExperimentChatgpt.Model
    | Counter Pages.Counter.Model
    | Math_Entropy Pages.Math.Entropy.Model
    | Photos_Paris Pages.Photos.Paris.Model
    | Science_Champagne Pages.Science.Champagne.Model
    | Science_ReasonWhy Pages.Science.ReasonWhy.Model
    | NotFound_ Pages.NotFound_.Model
    | Redirecting_
    | Loading_
