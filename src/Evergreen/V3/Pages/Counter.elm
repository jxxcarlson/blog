module Evergreen.V3.Pages.Counter exposing (..)


type alias Model =
    { counter : Int
    , window :
        { width : Int
        , height : Int
        }
    }


type Msg
    = UserClickedIncrement
    | UserClickedDecrement
