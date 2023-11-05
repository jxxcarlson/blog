module Evergreen.V9.Pages.Counter exposing (..)


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , counter : Int
    , routeString : String
    }


type Msg
    = UserClickedIncrement
    | UserClickedDecrement
