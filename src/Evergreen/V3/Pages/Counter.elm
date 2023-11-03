module Evergreen.V3.Pages.Counter exposing (..)


type alias Model =
    { counter : Int
    }


type Msg
    = UserClickedIncrement
    | UserClickedDecrement
