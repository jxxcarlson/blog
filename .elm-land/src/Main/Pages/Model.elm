module Main.Pages.Model exposing (Model(..))

import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Counter
import Pages.Photos.Paris
import Pages.Scripta
import Pages.NotFound_
import View exposing (View)


type Model
    = Home_ Pages.Home_.Model
    | About Pages.About.Model
    | Apps Pages.Apps.Model
    | Counter Pages.Counter.Model
    | Photos_Paris
    | Scripta Pages.Scripta.Model
    | NotFound_ Pages.NotFound_.Model
    | Redirecting_
    | Loading_
