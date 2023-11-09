module Main exposing (..)

import Auth
import Auth.Action
import Browser
import Browser.Navigation
import Effect exposing (Effect)
import Html exposing (Html)
import Json.Decode
import Layout
import Layouts
import Main.Layouts.Model
import Main.Layouts.Msg
import Main.Pages.Model
import Main.Pages.Msg
import Page
import Pages.Home_
import Pages.About
import Pages.Apps
import Pages.Art.ExperimentChatgpt
import Pages.Counter
import Pages.Photos
import Pages.Photos.NYC
import Pages.Photos.Paris
import Pages.Science
import Pages.Science.Champagne
import Pages.Science.CreationAndAnnihilation
import Pages.Science.Entropy
import Pages.NotFound_
import Pages.NotFound_
import Route exposing (Route)
import Route.Path
import Shared
import Task
import Url exposing (Url)
import View exposing (View)


main : Program Json.Decode.Value Model Msg
main =
    Browser.application
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }



-- INIT


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url
    , page : Main.Pages.Model.Model
    , layout : Maybe Main.Layouts.Model.Model
    , shared : Shared.Model
    }


init : Json.Decode.Value -> Url -> Browser.Navigation.Key -> ( Model, Cmd Msg )
init json url key =
    let
        flagsResult : Result Json.Decode.Error Shared.Flags
        flagsResult =
            Json.Decode.decodeValue Shared.decoder json

        ( sharedModel, sharedEffect ) =
            Shared.init flagsResult (Route.fromUrl () url)

        { page, layout } =
            initPageAndLayout { key = key, url = url, shared = sharedModel, layout = Nothing }
    in
    ( { url = url
      , key = key
      , page = Tuple.first page
      , layout = layout |> Maybe.map Tuple.first
      , shared = sharedModel
      }
    , Cmd.batch
          [ Tuple.second page
          , layout |> Maybe.map Tuple.second |> Maybe.withDefault Cmd.none
          , fromSharedEffect { key = key, url = url, shared = sharedModel } sharedEffect
          ]
    )


initPageAndLayout : { key : Browser.Navigation.Key, url : Url, shared : Shared.Model, layout : Maybe Main.Layouts.Model.Model } -> { page : ( Main.Pages.Model.Model, Cmd Msg ), layout : Maybe ( Main.Layouts.Model.Model, Cmd Msg ) }
initPageAndLayout model =
    case Route.Path.fromUrl model.url of
        Route.Path.Home_ ->
            let
                page : Page.Page Pages.Home_.Model Pages.Home_.Msg
                page =
                    Pages.Home_.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Home_
                    (Effect.map Main.Pages.Msg.Home_ >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.About ->
            let
                page : Page.Page Pages.About.Model Pages.About.Msg
                page =
                    Pages.About.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.About
                    (Effect.map Main.Pages.Msg.About >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Apps ->
            let
                page : Page.Page Pages.Apps.Model Pages.Apps.Msg
                page =
                    Pages.Apps.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Apps
                    (Effect.map Main.Pages.Msg.Apps >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Art_ExperimentChatgpt ->
            let
                page : Page.Page Pages.Art.ExperimentChatgpt.Model Pages.Art.ExperimentChatgpt.Msg
                page =
                    Pages.Art.ExperimentChatgpt.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Art_ExperimentChatgpt
                    (Effect.map Main.Pages.Msg.Art_ExperimentChatgpt >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Counter ->
            let
                page : Page.Page Pages.Counter.Model Pages.Counter.Msg
                page =
                    Pages.Counter.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Counter
                    (Effect.map Main.Pages.Msg.Counter >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Photos ->
            let
                page : Page.Page Pages.Photos.Model Pages.Photos.Msg
                page =
                    Pages.Photos.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Photos
                    (Effect.map Main.Pages.Msg.Photos >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Photos_NYC ->
            let
                page : Page.Page Pages.Photos.NYC.Model Pages.Photos.NYC.Msg
                page =
                    Pages.Photos.NYC.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Photos_NYC
                    (Effect.map Main.Pages.Msg.Photos_NYC >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Photos_Paris ->
            let
                page : Page.Page Pages.Photos.Paris.Model Pages.Photos.Paris.Msg
                page =
                    Pages.Photos.Paris.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Photos_Paris
                    (Effect.map Main.Pages.Msg.Photos_Paris >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Science ->
            let
                page : Page.Page Pages.Science.Model Pages.Science.Msg
                page =
                    Pages.Science.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Science
                    (Effect.map Main.Pages.Msg.Science >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Science_Champagne ->
            let
                page : Page.Page Pages.Science.Champagne.Model Pages.Science.Champagne.Msg
                page =
                    Pages.Science.Champagne.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Science_Champagne
                    (Effect.map Main.Pages.Msg.Science_Champagne >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Science_CreationAndAnnihilation ->
            let
                page : Page.Page Pages.Science.CreationAndAnnihilation.Model Pages.Science.CreationAndAnnihilation.Msg
                page =
                    Pages.Science.CreationAndAnnihilation.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Science_CreationAndAnnihilation
                    (Effect.map Main.Pages.Msg.Science_CreationAndAnnihilation >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.Science_Entropy ->
            let
                page : Page.Page Pages.Science.Entropy.Model Pages.Science.Entropy.Msg
                page =
                    Pages.Science.Entropy.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.Science_Entropy
                    (Effect.map Main.Pages.Msg.Science_Entropy >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }

        Route.Path.NotFound_ ->
            let
                page : Page.Page Pages.NotFound_.Model Pages.NotFound_.Msg
                page =
                    Pages.NotFound_.page model.shared (Route.fromUrl () model.url)

                ( pageModel, pageEffect ) =
                    Page.init page ()
            in
            { page = 
                Tuple.mapBoth
                    Main.Pages.Model.NotFound_
                    (Effect.map Main.Pages.Msg.NotFound_ >> fromPageEffect model)
                    ( pageModel, pageEffect )
            , layout = Nothing
            }


runWhenAuthenticated : { model | shared : Shared.Model, url : Url, key : Browser.Navigation.Key } -> (Auth.User -> ( Main.Pages.Model.Model, Cmd Msg )) -> ( Main.Pages.Model.Model, Cmd Msg )
runWhenAuthenticated model toTuple =
    let
        record =
            runWhenAuthenticatedWithLayout model (\user -> { page = toTuple user, layout = Nothing })
    in
    record.page


runWhenAuthenticatedWithLayout : { model | shared : Shared.Model, url : Url, key : Browser.Navigation.Key } -> (Auth.User -> { page : ( Main.Pages.Model.Model, Cmd Msg ), layout : Maybe ( Main.Layouts.Model.Model, Cmd Msg ) }) -> { page : ( Main.Pages.Model.Model, Cmd Msg ), layout : Maybe ( Main.Layouts.Model.Model, Cmd Msg ) }
runWhenAuthenticatedWithLayout model toRecord =
    let
        authAction : Auth.Action.Action Auth.User
        authAction =
            Auth.onPageLoad model.shared (Route.fromUrl () model.url)

        toCmd : Effect Msg -> Cmd Msg
        toCmd =
            Effect.toCmd
                { key = model.key
                , url = model.url
                , shared = model.shared
                , fromSharedMsg = Shared
                , batch = Batch
                , toCmd = Task.succeed >> Task.perform identity
                }
    in
    case authAction of
        Auth.Action.LoadPageWithUser user ->
            toRecord user

        Auth.Action.ShowLoadingPage loadingView ->
            { page = 
                ( Main.Pages.Model.Loading_
                , Cmd.none
                )
            , layout = Nothing
            }

        Auth.Action.ReplaceRoute options ->
            { page = 
                ( Main.Pages.Model.Redirecting_
                , toCmd (Effect.replaceRoute options)
                )
            , layout = Nothing
            }

        Auth.Action.PushRoute options ->
            { page = 
                ( Main.Pages.Model.Redirecting_
                , toCmd (Effect.pushRoute options)
                )
            , layout = Nothing
            }

        Auth.Action.LoadExternalUrl externalUrl ->
            { page = 
                ( Main.Pages.Model.Redirecting_
                , Browser.Navigation.load externalUrl
                )
            , layout = Nothing
            }



-- UPDATE


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url
    | Page Main.Pages.Msg.Msg
    | Layout Main.Layouts.Msg.Msg
    | Shared Shared.Msg
    | Batch (List Msg)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested (Browser.Internal url) ->
            ( model
            , Browser.Navigation.pushUrl model.key (Url.toString url)
            )

        UrlRequested (Browser.External url) ->
            ( model
            , Browser.Navigation.load url
            )

        UrlChanged url ->
            if Route.Path.fromUrl url == Route.Path.fromUrl model.url then
                let
                    newModel : Model
                    newModel =
                        { model | url = url }
                in
                ( newModel
                , Cmd.batch
                      [ toPageUrlHookCmd newModel
                            { from = Route.fromUrl () model.url
                            , to = Route.fromUrl () newModel.url
                            }
                      , toLayoutUrlHookCmd model newModel
                            { from = Route.fromUrl () model.url
                            , to = Route.fromUrl () newModel.url
                            }
                      ]
                )

            else
                let
                    { page, layout } =
                        initPageAndLayout { key = model.key, shared = model.shared, layout = model.layout, url = url }

                    ( pageModel, pageCmd ) =
                        page

                    ( layoutModel, layoutCmd ) =
                        case layout of
                            Just ( layoutModel_, layoutCmd_ ) ->
                                ( Just layoutModel_, layoutCmd_ )

                            Nothing ->
                                ( Nothing, Cmd.none )

                    newModel =
                        { model | url = url, page = pageModel, layout = layoutModel }
                in
                ( newModel
                , Cmd.batch
                      [ pageCmd
                      , layoutCmd
                      , toLayoutUrlHookCmd model newModel
                            { from = Route.fromUrl () model.url
                            , to = Route.fromUrl () newModel.url
                            }
                      ]
                )

        Page pageMsg ->
            let
                ( pageModel, pageCmd ) =
                    updateFromPage pageMsg model
            in
            ( { model | page = pageModel }
            , pageCmd
            )

        Layout layoutMsg ->
            let
                ( layoutModel, layoutCmd ) =
                    updateFromLayout layoutMsg model
            in
            ( { model | layout = layoutModel }
            , layoutCmd
            )

        Shared sharedMsg ->
            let
                ( sharedModel, sharedEffect ) =
                    Shared.update (Route.fromUrl () model.url) sharedMsg model.shared

                ( oldAction, newAction ) =
                    ( Auth.onPageLoad model.shared (Route.fromUrl () model.url)
                    , Auth.onPageLoad sharedModel (Route.fromUrl () model.url)
                    )
            in
            if isAuthProtected (Route.fromUrl () model.url).path && (hasActionTypeChanged oldAction newAction) then
                let
                    { layout, page } =
                        initPageAndLayout { key = model.key, shared = sharedModel, url = model.url, layout = model.layout }

                    ( pageModel, pageCmd ) =
                        page

                    ( layoutModel, layoutCmd ) =
                        ( layout |> Maybe.map Tuple.first
                        , layout |> Maybe.map Tuple.second |> Maybe.withDefault Cmd.none
                        )
                in
                ( { model | shared = sharedModel, page = pageModel, layout = layoutModel }
                , Cmd.batch
                      [ pageCmd
                      , layoutCmd
                      , fromSharedEffect { model | shared = sharedModel } sharedEffect
                      ]
                )

            else
                ( { model | shared = sharedModel }
                , fromSharedEffect { model | shared = sharedModel } sharedEffect
                )

        Batch messages ->
            ( model
            , messages
                  |> List.map (Task.succeed >> Task.perform identity)
                  |> Cmd.batch
            )


updateFromPage : Main.Pages.Msg.Msg -> Model -> ( Main.Pages.Model.Model, Cmd Msg )
updateFromPage msg model =
    case ( msg, model.page ) of
        ( Main.Pages.Msg.Home_ pageMsg, Main.Pages.Model.Home_ pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Home_
                (Effect.map Main.Pages.Msg.Home_ >> fromPageEffect model)
                (Page.update (Pages.Home_.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.About pageMsg, Main.Pages.Model.About pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.About
                (Effect.map Main.Pages.Msg.About >> fromPageEffect model)
                (Page.update (Pages.About.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Apps pageMsg, Main.Pages.Model.Apps pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Apps
                (Effect.map Main.Pages.Msg.Apps >> fromPageEffect model)
                (Page.update (Pages.Apps.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Art_ExperimentChatgpt pageMsg, Main.Pages.Model.Art_ExperimentChatgpt pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Art_ExperimentChatgpt
                (Effect.map Main.Pages.Msg.Art_ExperimentChatgpt >> fromPageEffect model)
                (Page.update (Pages.Art.ExperimentChatgpt.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Counter pageMsg, Main.Pages.Model.Counter pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Counter
                (Effect.map Main.Pages.Msg.Counter >> fromPageEffect model)
                (Page.update (Pages.Counter.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Photos pageMsg, Main.Pages.Model.Photos pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Photos
                (Effect.map Main.Pages.Msg.Photos >> fromPageEffect model)
                (Page.update (Pages.Photos.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Photos_NYC pageMsg, Main.Pages.Model.Photos_NYC pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Photos_NYC
                (Effect.map Main.Pages.Msg.Photos_NYC >> fromPageEffect model)
                (Page.update (Pages.Photos.NYC.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Photos_Paris pageMsg, Main.Pages.Model.Photos_Paris pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Photos_Paris
                (Effect.map Main.Pages.Msg.Photos_Paris >> fromPageEffect model)
                (Page.update (Pages.Photos.Paris.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Science pageMsg, Main.Pages.Model.Science pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Science
                (Effect.map Main.Pages.Msg.Science >> fromPageEffect model)
                (Page.update (Pages.Science.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Science_Champagne pageMsg, Main.Pages.Model.Science_Champagne pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Science_Champagne
                (Effect.map Main.Pages.Msg.Science_Champagne >> fromPageEffect model)
                (Page.update (Pages.Science.Champagne.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Science_CreationAndAnnihilation pageMsg, Main.Pages.Model.Science_CreationAndAnnihilation pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Science_CreationAndAnnihilation
                (Effect.map Main.Pages.Msg.Science_CreationAndAnnihilation >> fromPageEffect model)
                (Page.update (Pages.Science.CreationAndAnnihilation.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.Science_Entropy pageMsg, Main.Pages.Model.Science_Entropy pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.Science_Entropy
                (Effect.map Main.Pages.Msg.Science_Entropy >> fromPageEffect model)
                (Page.update (Pages.Science.Entropy.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        ( Main.Pages.Msg.NotFound_ pageMsg, Main.Pages.Model.NotFound_ pageModel ) ->
            Tuple.mapBoth
                Main.Pages.Model.NotFound_
                (Effect.map Main.Pages.Msg.NotFound_ >> fromPageEffect model)
                (Page.update (Pages.NotFound_.page model.shared (Route.fromUrl () model.url)) pageMsg pageModel)

        _ ->
            ( model.page
            , Cmd.none
            )


updateFromLayout : Main.Layouts.Msg.Msg -> Model -> ( Maybe Main.Layouts.Model.Model, Cmd Msg )
updateFromLayout msg model =
    let
        route : Route ()
        route =
            Route.fromUrl () model.url
    in
    case ( toLayoutFromPage model, model.layout, msg ) of
        _ ->
            ( model.layout
            , Cmd.none
            )


toLayoutFromPage : Model -> Maybe (Layouts.Layout Msg)
toLayoutFromPage model =
    case model.page of
        Main.Pages.Model.Home_ pageModel ->
            Route.fromUrl () model.url
                |> Pages.Home_.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Home_ >> Page))

        Main.Pages.Model.About pageModel ->
            Route.fromUrl () model.url
                |> Pages.About.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.About >> Page))

        Main.Pages.Model.Apps pageModel ->
            Route.fromUrl () model.url
                |> Pages.Apps.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Apps >> Page))

        Main.Pages.Model.Art_ExperimentChatgpt pageModel ->
            Route.fromUrl () model.url
                |> Pages.Art.ExperimentChatgpt.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Art_ExperimentChatgpt >> Page))

        Main.Pages.Model.Counter pageModel ->
            Route.fromUrl () model.url
                |> Pages.Counter.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Counter >> Page))

        Main.Pages.Model.Photos pageModel ->
            Route.fromUrl () model.url
                |> Pages.Photos.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Photos >> Page))

        Main.Pages.Model.Photos_NYC pageModel ->
            Route.fromUrl () model.url
                |> Pages.Photos.NYC.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Photos_NYC >> Page))

        Main.Pages.Model.Photos_Paris pageModel ->
            Route.fromUrl () model.url
                |> Pages.Photos.Paris.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Photos_Paris >> Page))

        Main.Pages.Model.Science pageModel ->
            Route.fromUrl () model.url
                |> Pages.Science.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Science >> Page))

        Main.Pages.Model.Science_Champagne pageModel ->
            Route.fromUrl () model.url
                |> Pages.Science.Champagne.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Science_Champagne >> Page))

        Main.Pages.Model.Science_CreationAndAnnihilation pageModel ->
            Route.fromUrl () model.url
                |> Pages.Science.CreationAndAnnihilation.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Science_CreationAndAnnihilation >> Page))

        Main.Pages.Model.Science_Entropy pageModel ->
            Route.fromUrl () model.url
                |> Pages.Science.Entropy.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.Science_Entropy >> Page))

        Main.Pages.Model.NotFound_ pageModel ->
            Route.fromUrl () model.url
                |> Pages.NotFound_.page model.shared
                |> Page.layout pageModel
                |> Maybe.map (Layouts.map (Main.Pages.Msg.NotFound_ >> Page))

        Main.Pages.Model.Redirecting_ ->
            Nothing

        Main.Pages.Model.Loading_ ->
            Nothing


toAuthProtectedPage : Model -> (Auth.User -> Shared.Model -> Route params -> Page.Page model msg) -> Route params -> Maybe (Page.Page model msg)
toAuthProtectedPage model toPage route =
    case Auth.onPageLoad model.shared (Route.fromUrl () model.url) of
        Auth.Action.LoadPageWithUser user ->
            Just (toPage user model.shared route)

        _ ->
            Nothing


hasActionTypeChanged : Auth.Action.Action user -> Auth.Action.Action user -> Bool
hasActionTypeChanged oldAction newAction =
    case ( newAction, oldAction ) of
        ( Auth.Action.LoadPageWithUser _, Auth.Action.LoadPageWithUser _ ) ->
            False

        ( Auth.Action.ShowLoadingPage _, Auth.Action.ShowLoadingPage _ ) ->
            False

        ( Auth.Action.ReplaceRoute _, Auth.Action.ReplaceRoute _ ) ->
            False

        ( Auth.Action.PushRoute _, Auth.Action.PushRoute _ ) ->
            False

        ( Auth.Action.LoadExternalUrl _, Auth.Action.LoadExternalUrl _ ) ->
            False

        ( _,  _ ) ->
            True


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        subscriptionsFromPage : Sub Msg
        subscriptionsFromPage =
            case model.page of
                Main.Pages.Model.Home_ pageModel ->
                    Page.subscriptions (Pages.Home_.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Home_
                        |> Sub.map Page

                Main.Pages.Model.About pageModel ->
                    Page.subscriptions (Pages.About.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.About
                        |> Sub.map Page

                Main.Pages.Model.Apps pageModel ->
                    Page.subscriptions (Pages.Apps.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Apps
                        |> Sub.map Page

                Main.Pages.Model.Art_ExperimentChatgpt pageModel ->
                    Page.subscriptions (Pages.Art.ExperimentChatgpt.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Art_ExperimentChatgpt
                        |> Sub.map Page

                Main.Pages.Model.Counter pageModel ->
                    Page.subscriptions (Pages.Counter.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Counter
                        |> Sub.map Page

                Main.Pages.Model.Photos pageModel ->
                    Page.subscriptions (Pages.Photos.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Photos
                        |> Sub.map Page

                Main.Pages.Model.Photos_NYC pageModel ->
                    Page.subscriptions (Pages.Photos.NYC.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Photos_NYC
                        |> Sub.map Page

                Main.Pages.Model.Photos_Paris pageModel ->
                    Page.subscriptions (Pages.Photos.Paris.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Photos_Paris
                        |> Sub.map Page

                Main.Pages.Model.Science pageModel ->
                    Page.subscriptions (Pages.Science.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Science
                        |> Sub.map Page

                Main.Pages.Model.Science_Champagne pageModel ->
                    Page.subscriptions (Pages.Science.Champagne.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Science_Champagne
                        |> Sub.map Page

                Main.Pages.Model.Science_CreationAndAnnihilation pageModel ->
                    Page.subscriptions (Pages.Science.CreationAndAnnihilation.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Science_CreationAndAnnihilation
                        |> Sub.map Page

                Main.Pages.Model.Science_Entropy pageModel ->
                    Page.subscriptions (Pages.Science.Entropy.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.Science_Entropy
                        |> Sub.map Page

                Main.Pages.Model.NotFound_ pageModel ->
                    Page.subscriptions (Pages.NotFound_.page model.shared (Route.fromUrl () model.url)) pageModel
                        |> Sub.map Main.Pages.Msg.NotFound_
                        |> Sub.map Page

                Main.Pages.Model.Redirecting_ ->
                    Sub.none

                Main.Pages.Model.Loading_ ->
                    Sub.none

        maybeLayout : Maybe (Layouts.Layout Msg)
        maybeLayout =
            toLayoutFromPage model

        route : Route ()
        route =
            Route.fromUrl () model.url

        subscriptionsFromLayout : Sub Msg
        subscriptionsFromLayout =
            case ( maybeLayout, model.layout ) of
                _ ->
                    Sub.none
    in
    Sub.batch
        [ Shared.subscriptions route model.shared
              |> Sub.map Shared
        , subscriptionsFromPage
        , subscriptionsFromLayout
        ]



-- VIEW


view : Model -> Browser.Document Msg
view model =
    let
        view_ : View Msg
        view_ =
            toView model
    in
    View.toBrowserDocument
        { shared = model.shared
        , route = Route.fromUrl () model.url
        , view = view_
        }


toView : Model -> View Msg
toView model =
    viewPage model


viewPage : Model -> View Msg
viewPage model =
    case model.page of
        Main.Pages.Model.Home_ pageModel ->
            Page.view (Pages.Home_.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Home_
                |> View.map Page

        Main.Pages.Model.About pageModel ->
            Page.view (Pages.About.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.About
                |> View.map Page

        Main.Pages.Model.Apps pageModel ->
            Page.view (Pages.Apps.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Apps
                |> View.map Page

        Main.Pages.Model.Art_ExperimentChatgpt pageModel ->
            Page.view (Pages.Art.ExperimentChatgpt.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Art_ExperimentChatgpt
                |> View.map Page

        Main.Pages.Model.Counter pageModel ->
            Page.view (Pages.Counter.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Counter
                |> View.map Page

        Main.Pages.Model.Photos pageModel ->
            Page.view (Pages.Photos.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Photos
                |> View.map Page

        Main.Pages.Model.Photos_NYC pageModel ->
            Page.view (Pages.Photos.NYC.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Photos_NYC
                |> View.map Page

        Main.Pages.Model.Photos_Paris pageModel ->
            Page.view (Pages.Photos.Paris.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Photos_Paris
                |> View.map Page

        Main.Pages.Model.Science pageModel ->
            Page.view (Pages.Science.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Science
                |> View.map Page

        Main.Pages.Model.Science_Champagne pageModel ->
            Page.view (Pages.Science.Champagne.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Science_Champagne
                |> View.map Page

        Main.Pages.Model.Science_CreationAndAnnihilation pageModel ->
            Page.view (Pages.Science.CreationAndAnnihilation.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Science_CreationAndAnnihilation
                |> View.map Page

        Main.Pages.Model.Science_Entropy pageModel ->
            Page.view (Pages.Science.Entropy.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.Science_Entropy
                |> View.map Page

        Main.Pages.Model.NotFound_ pageModel ->
            Page.view (Pages.NotFound_.page model.shared (Route.fromUrl () model.url)) pageModel
                |> View.map Main.Pages.Msg.NotFound_
                |> View.map Page

        Main.Pages.Model.Redirecting_ ->
            View.none

        Main.Pages.Model.Loading_ ->
            Auth.viewLoadingPage model.shared (Route.fromUrl () model.url)
                |> View.map never



-- INTERNALS


fromPageEffect : { model | key : Browser.Navigation.Key, url : Url, shared : Shared.Model } -> Effect Main.Pages.Msg.Msg -> Cmd Msg
fromPageEffect model effect =
    Effect.toCmd
        { key = model.key
        , url = model.url
        , shared = model.shared
        , fromSharedMsg = Shared
        , batch = Batch
        , toCmd = Task.succeed >> Task.perform identity
        }
        (Effect.map Page effect)


fromLayoutEffect : { model | key : Browser.Navigation.Key, url : Url, shared : Shared.Model } -> Effect Main.Layouts.Msg.Msg -> Cmd Msg
fromLayoutEffect model effect =
    Effect.toCmd
        { key = model.key
        , url = model.url
        , shared = model.shared
        , fromSharedMsg = Shared
        , batch = Batch
        , toCmd = Task.succeed >> Task.perform identity
        }
        (Effect.map Layout effect)


fromSharedEffect : { model | key : Browser.Navigation.Key, url : Url, shared : Shared.Model } -> Effect Shared.Msg -> Cmd Msg
fromSharedEffect model effect =
    Effect.toCmd
        { key = model.key
        , url = model.url
        , shared = model.shared
        , fromSharedMsg = Shared
        , batch = Batch
        , toCmd = Task.succeed >> Task.perform identity
        }
        (Effect.map Shared effect)



-- URL HOOKS FOR PAGES


toPageUrlHookCmd : Model -> { from : Route (), to : Route () } -> Cmd Msg
toPageUrlHookCmd model routes =
    let
        toCommands messages =
            messages
                |> List.map (Task.succeed >> Task.perform identity)
                |> Cmd.batch
    in
    case model.page of
        Main.Pages.Model.Home_ pageModel ->
            Page.toUrlMessages routes (Pages.Home_.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Home_
                |> List.map Page
                |> toCommands

        Main.Pages.Model.About pageModel ->
            Page.toUrlMessages routes (Pages.About.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.About
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Apps pageModel ->
            Page.toUrlMessages routes (Pages.Apps.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Apps
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Art_ExperimentChatgpt pageModel ->
            Page.toUrlMessages routes (Pages.Art.ExperimentChatgpt.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Art_ExperimentChatgpt
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Counter pageModel ->
            Page.toUrlMessages routes (Pages.Counter.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Counter
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Photos pageModel ->
            Page.toUrlMessages routes (Pages.Photos.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Photos
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Photos_NYC pageModel ->
            Page.toUrlMessages routes (Pages.Photos.NYC.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Photos_NYC
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Photos_Paris pageModel ->
            Page.toUrlMessages routes (Pages.Photos.Paris.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Photos_Paris
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Science pageModel ->
            Page.toUrlMessages routes (Pages.Science.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Science
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Science_Champagne pageModel ->
            Page.toUrlMessages routes (Pages.Science.Champagne.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Science_Champagne
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Science_CreationAndAnnihilation pageModel ->
            Page.toUrlMessages routes (Pages.Science.CreationAndAnnihilation.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Science_CreationAndAnnihilation
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Science_Entropy pageModel ->
            Page.toUrlMessages routes (Pages.Science.Entropy.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.Science_Entropy
                |> List.map Page
                |> toCommands

        Main.Pages.Model.NotFound_ pageModel ->
            Page.toUrlMessages routes (Pages.NotFound_.page model.shared (Route.fromUrl () model.url)) 
                |> List.map Main.Pages.Msg.NotFound_
                |> List.map Page
                |> toCommands

        Main.Pages.Model.Redirecting_ ->
            Cmd.none

        Main.Pages.Model.Loading_ ->
            Cmd.none


toLayoutUrlHookCmd : Model -> Model -> { from : Route (), to : Route () } -> Cmd Msg
toLayoutUrlHookCmd oldModel model routes =
    let
        toCommands messages =
            if shouldFireUrlChangedEvents then
                messages
                    |> List.map (Task.succeed >> Task.perform identity)
                    |> Cmd.batch

            else
                Cmd.none

        shouldFireUrlChangedEvents =
            hasNavigatedWithinNewLayout
                { from = toLayoutFromPage oldModel
                , to = toLayoutFromPage model
                }

        route =
            Route.fromUrl () model.url
    in
    case ( toLayoutFromPage model, model.layout ) of
        _ ->
            Cmd.none


hasNavigatedWithinNewLayout : { from : Maybe (Layouts.Layout msg), to : Maybe (Layouts.Layout msg) } -> Bool
hasNavigatedWithinNewLayout { from, to } =
    let
        isRelated maybePair =
            case maybePair of
                _ ->
                    False
    in
    List.any isRelated
        [ Maybe.map2 Tuple.pair from to
        , Maybe.map2 Tuple.pair to from
        ]


isAuthProtected : Route.Path.Path -> Bool
isAuthProtected routePath =
    case routePath of
        Route.Path.Home_ ->
            False

        Route.Path.About ->
            False

        Route.Path.Apps ->
            False

        Route.Path.Art_ExperimentChatgpt ->
            False

        Route.Path.Counter ->
            False

        Route.Path.Photos ->
            False

        Route.Path.Photos_NYC ->
            False

        Route.Path.Photos_Paris ->
            False

        Route.Path.Science ->
            False

        Route.Path.Science_Champagne ->
            False

        Route.Path.Science_CreationAndAnnihilation ->
            False

        Route.Path.Science_Entropy ->
            False

        Route.Path.NotFound_ ->
            False
