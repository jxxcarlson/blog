module Evergreen.V4.Shared.Model exposing (..)


type alias Model =
    { smashedLikes : Int
    , window :
        { width : Int
        , height : Int
        }
    }
