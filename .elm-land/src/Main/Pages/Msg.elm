module Main.Pages.Msg exposing (Msg(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Counter
import Pages.Photos.Paris
import Pages.Science.Champagne
import Pages.Science.ReasonWhy
import Pages.Scripta
import Pages.NotFound_


type Msg
    = Home_ Pages.Home_.Msg
    | About Pages.About.Msg
    | Apps Pages.Apps.Msg
    | Counter Pages.Counter.Msg
    | Photos_Paris
    | Science_Champagne
    | Science_ReasonWhy Pages.Science.ReasonWhy.Msg
    | Scripta Pages.Scripta.Msg
    | NotFound_ Pages.NotFound_.Msg
