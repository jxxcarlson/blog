module Shared exposing
    ( Flags, decoder
    , Model, Msg
    , init, update, subscriptions
    )

{-|

@docs Flags, decoder
@docs Model, Msg
@docs init, update, subscriptions

-}

import Browser.Dom as Dom
import Browser.Events
import Effect exposing (Effect)
import Json.Decode
import Route exposing (Route)
import Route.Path
import Shared.Model
import Shared.Msg
import Task


type alias Model =
    Shared.Model.Model



-- FLAGS


type alias Flags =
    { width : Int, height : Int }


decoder : Json.Decode.Decoder Flags
decoder =
    Json.Decode.map2 Flags
        (Json.Decode.field "width" Json.Decode.int)
        (Json.Decode.field "height" Json.Decode.int)



-- INIT


init : Result Json.Decode.Error Flags -> Route () -> ( Model, Effect Msg )
init flagsResult route =
    let
        flags : Flags
        flags =
            case flagsResult of
                Ok value ->
                    value

                Err reason ->
                    { width = 700
                    , height = 1100
                    }
    in
    ( { smashedLikes = 0
      , window =
            { width = flags.width
            , height = flags.height
            }
      }
    , Effect.none
    )



--type alias Model =
--    { smashedLikes : Int
--    , window :
--        { smashedLikes : Int
--        , window : Window
--        }
--    }
--
--
--type alias Window =
--    { width : Int, height : Int }
-- UPDATE


type alias Msg =
    Shared.Msg.Msg


update : Route () -> Msg -> Model -> ( Model, Effect Msg )
update route msg model =
    case msg of
        Shared.Msg.GotNewSmashedLikes count ->
            ( { model | smashedLikes = count }
            , Effect.none
            )

        Shared.Msg.WindowResized width height ->
            ( { model
                | window = { width = width, height = height }
              }
            , Effect.none
            )

        Shared.Msg.Render _ ->
            ( model, Effect.none )



-- SUBSCRIPTIONS


subscriptions : Route () -> Model -> Sub Msg
subscriptions route model =
    Browser.Events.onResize Shared.Msg.WindowResized
