module Components.Index2 exposing (..)

import Blog.Msg
import Color
import Config
import Effect exposing (Effect)
import Element exposing (..)
import Element.Background as Background
import Element.Font as Font
import Element.Input
import Geometry
import Route exposing (Route)
import Shared
import View exposing (View)


type Index msg
    = Settings
        { model : Model
        , toMsg : Msg msg -> msg
        , onChange : Maybe (() -> msg)
        }


type Msg msg
    = NoOp
    | ToggleIndex


type Model
    = Model
        { window : { width : Int, height : Int }
        , routeString : String
        , state : State
        }


new :
    { model : Model
    , toMsg : Msg msg -> msg
    }
    -> Index msg
new props =
    Settings
        { model = props.model
        , toMsg = props.toMsg
        , onChange = Nothing
        }


init : Shared.Model -> Route () -> () -> ( Model, Effect msg )
init shared route _ =
    ( Model
        { window = shared.dimensions
        , routeString = Route.toString route
        , state = initState shared.dimensions.width
        }
    , Effect.none
    )


initState : Int -> State
initState width =
    if width < Config.mobileWidth then
        Mobile IndexClosed

    else
        Desktop


type State
    = Desktop
    | Mobile MobileState


type MobileState
    = IndexOpen
    | IndexClosed


update :
    { msg : Msg msg
    , model : Model
    , toModel : Model -> model
    , toMsg : Msg msg -> msg
    }
    -> ( model, Effect msg )
update props =
    let
        (Model model) =
            props.model

        toParentModel : ( Model, Effect msg ) -> ( model, Effect msg )
        toParentModel ( innerModel, effect ) =
            ( props.toModel innerModel
            , effect
            )
    in
    toParentModel <|
        case props.msg of
            NoOp ->
                ( Model model
                , Effect.none
                )

            ToggleIndex ->
                case model.state of
                    Desktop ->
                        ( Model
                            { model
                                | state =
                                    case model.state of
                                        Desktop ->
                                            Desktop

                                        Mobile IndexOpen ->
                                            Desktop

                                        Mobile IndexClosed ->
                                            Desktop
                            }
                        , Effect.none
                        )

                    Mobile state ->
                        ( Model
                            { model
                                | state =
                                    case model.state of
                                        Mobile IndexOpen ->
                                            Mobile IndexClosed

                                        Mobile IndexClosed ->
                                            Mobile IndexOpen

                                        Desktop ->
                                            Desktop
                            }
                        , Effect.none
                        )


view :
    Index (Msg msg)
    -> { a | title : String, currentRoute : String, element : Element (Msg msg) }
    -> View (Msg msg)
view ((Settings settings) as index) props =
    let
        (Model inner) =
            settings.model
    in
    case inner.state of
        Desktop ->
            desktopView_ inner.window props

        Mobile _ ->
            mobileView_ index inner props


mobileView_ :
    Index (Msg msg)
    -> { a | window : { width : Int, height : Int }, state : State }
    -> { b | title : c, currentRoute : String, element : Element (Msg msg) }
    -> { title : c, attributes : List d, element : Element (Msg msg) }
mobileView_ (Settings settings) inner props =
    { title = props.title
    , attributes = []
    , element =
        row []
            [ lhs inner.window |> Element.map settings.toMsg
            , mobileIndexView inner props
            , props.element
            ]
    }


mobileIndexView :
    { a | state : State, window : { width : Int, height : Int } }
    -> { b | currentRoute : String }
    -> Element (Msg msg)
mobileIndexView inner props =
    case inner.state of
        Desktop ->
            Element.none

        Mobile IndexOpen ->
            index_ inner.window props.currentRoute

        Mobile IndexClosed ->
            tinyIndexView inner


tinyIndexView : { a | window : { b | height : Int, width : Int }, state : State } -> Element (Msg msg)
tinyIndexView inner =
    column [ width (px 40), height (px inner.window.height), Background.color Color.sidebar ]
        [ toggleButton inner, el [ alignBottom, Font.size 10, Font.color Color.red ] (text <| "w = " ++ String.fromInt inner.window.width ++ ", h = " ++ String.fromInt inner.window.height) ]


toggleButton : { a | state : State } -> Element (Msg msg)
toggleButton model =
    let
        labelText =
            case model.state of
                Desktop ->
                    "Desktop"

                Mobile IndexOpen ->
                    "Open"

                Mobile IndexClosed ->
                    "Closed"
    in
    Element.Input.button [] { onPress = Just ToggleIndex, label = el [] (text labelText) }


desktopView_ :
    { width : Int, height : Int }
    -> { a | title : String, currentRoute : String, element : Element msg }
    -> View msg
desktopView_ dimensions props =
    { title = props.title
    , attributes = []
    , element =
        row []
            [ lhs dimensions
            , index_ dimensions props.currentRoute
            , props.element
            ]
    }


lhs : { width : Int, height : Int } -> Element msg
lhs window =
    column
        [ width (px (Geometry.lhsWidth window))
        , height (px window.height)
        , Background.color Color.borderColor
        ]
        []


fontSize dimensions =
    if dimensions.width < 800 then
        10

    else if dimensions.width < 1000 then
        12

    else
        14



--index_ : { width : Int, height : Int } -> String -> Element msg


index_ dimensions currentRoute =
    column
        [ alignTop
        , Font.size (fontSize dimensions)
        , spacing 8
        , width (px <| Geometry.sidebarWidth dimensions)
        , height fill
        , Font.size 12
        , paddingXY 18 18
        , Font.color Color.white
        , Background.color Color.sidebar
        ]
        [ item currentRoute "/" "Home"
        , item currentRoute "/about" "About"
        , item currentRoute "/art/experiment-chatgpt" "Art: ChatGPT"
        , item currentRoute "/photos/n-y-c" "Photos: New York City"
        , item currentRoute "/photos/paris" "Photos: Paris"
        , item currentRoute "/science/champagne" "Science: Champagne"
        , item currentRoute "/science/reason-why" "Science: The Reason Why"
        , item currentRoute "/math/entropy" "Math: Entropy"
        , item currentRoute "/apps" "Apps"
        , el [ alignBottom, Font.size (fontSize dimensions), Font.color Color.red ] (text <| "w = " ++ String.fromInt dimensions.width ++ ", h = " ++ String.fromInt dimensions.height)

        --, item currentRoute "/counter" "Counter"
        ]


item currentRoute url title =
    if currentRoute == url then
        link [] { url = url, label = el [ Font.color Color.red ] (text title) }

    else
        link [] { url = url, label = el [] (text title) }
