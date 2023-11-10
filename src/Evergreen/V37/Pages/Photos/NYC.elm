module Evergreen.V37.Pages.Photos.NYC exposing (..)


type alias Model =
    { window :
        { width : Int
        , height : Int
        }
    , routeString : String
    }


type Msg
    = NoOp
