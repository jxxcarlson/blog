module Evergreen.V22.Shared.Model exposing (..)


type alias Model =
    { smashedLikes : Int
    , dimensions :
        { width : Int
        , height : Int
        }
    }
