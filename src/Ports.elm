port module Ports exposing (Dimensions, dimensions)

import Json.Decode as Decode


type alias Dimensions =
    { height : Int
    , width : Int
    }


port dimensions : (Dimensions -> msg) -> Sub msg


decodeDimensions : Decode.Decoder Dimensions
decodeDimensions =
    Decode.map2 Dimensions
        (Decode.field "height" Decode.int)
        (Decode.field "width" Decode.int)
