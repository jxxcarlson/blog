module Evergreen.V7.Shared.Model exposing (..)


type alias Model =
    { smashedLikes : Int
    , window :
        { width : Int
        , height : Int
        }
    }
