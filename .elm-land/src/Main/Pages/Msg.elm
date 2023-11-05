module Main.Pages.Msg exposing (Msg(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Art.ExperimentChatgpt
import Pages.Counter
import Pages.Photos.Paris
import Pages.Science.Champagne
import Pages.Science.ReasonWhy
import Pages.NotFound_


type Msg
    = Home_ Pages.Home_.Msg
    | About Pages.About.Msg
    | Apps Pages.Apps.Msg
    | Art_ExperimentChatgpt Pages.Art.ExperimentChatgpt.Msg
    | Counter Pages.Counter.Msg
    | Photos_Paris Pages.Photos.Paris.Msg
    | Science_Champagne Pages.Science.Champagne.Msg
    | Science_ReasonWhy Pages.Science.ReasonWhy.Msg
    | NotFound_ Pages.NotFound_.Msg
