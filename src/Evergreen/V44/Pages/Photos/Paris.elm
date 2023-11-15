module Evergreen.V44.Pages.Photos.Paris exposing (..)


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = NoOp
