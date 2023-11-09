module Evergreen.V33.Shared.Model exposing (..)


type alias Model =
    { smashedLikes : Int
    , dimensions :
        { width : Int
        , height : Int
        }
    }
