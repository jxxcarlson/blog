module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Counter
import Pages.Photos.Paris
import Pages.Science.Champagne
import Pages.Science.ReasonWhy
import Pages.Scripta
import Pages.NotFound_
import View exposing (View)


type Model
    = Home_ Pages.Home_.Model
    | About Pages.About.Model
    | Apps Pages.Apps.Model
    | Counter Pages.Counter.Model
    | Photos_Paris
    | Science_Champagne
    | Science_ReasonWhy
    | Scripta Pages.Scripta.Model
    | NotFound_ Pages.NotFound_.Model
    | Redirecting_
    | Loading_
