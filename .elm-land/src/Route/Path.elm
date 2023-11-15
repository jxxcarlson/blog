module Route.Path exposing (Path(..), fromString, fromUrl, href, toString)

import Html
import Html.Attributes
import Url exposing (Url)
import Url.Parser exposing ((</>))


type Path
    = Home_
    | About
    | Apps
    | Apps_DrumMachine
    | Apps_RandomExchangeModel
    | Art_ExperimentChatgpt
    | Counter
    | Photos
    | Photos_NYC
    | Photos_Paris
    | Science
    | Science_Atoms
    | Science_Champagne
    | Science_CreationAndAnnihilation
    | Science_Entropy
    | Science_IdeaOfAtom
    | Science_Neutrino
    | Science_OldestTree
    | Science_PeriodicTable
    | NotFound_


fromUrl : Url -> Path
fromUrl url =
    fromString url.path
        |> Maybe.withDefault NotFound_


fromString : String -> Maybe Path
fromString urlPath =
    let
        urlPathSegments : List String
        urlPathSegments =
            urlPath
                |> String.split "/"
                |> List.filter (String.trim >> String.isEmpty >> Basics.not)
    in
    case urlPathSegments of
        [] ->
            Just Home_

        "about" :: [] ->
            Just About

        "apps" :: [] ->
            Just Apps

        "apps" :: "drum-machine" :: [] ->
            Just Apps_DrumMachine

        "apps" :: "random-exchange-model" :: [] ->
            Just Apps_RandomExchangeModel

        "art" :: "experiment-chatgpt" :: [] ->
            Just Art_ExperimentChatgpt

        "counter" :: [] ->
            Just Counter

        "photos" :: [] ->
            Just Photos

        "photos" :: "n-y-c" :: [] ->
            Just Photos_NYC

        "photos" :: "paris" :: [] ->
            Just Photos_Paris

        "science" :: [] ->
            Just Science

        "science" :: "atoms" :: [] ->
            Just Science_Atoms

        "science" :: "champagne" :: [] ->
            Just Science_Champagne

        "science" :: "creation-and-annihilation" :: [] ->
            Just Science_CreationAndAnnihilation

        "science" :: "entropy" :: [] ->
            Just Science_Entropy

        "science" :: "idea-of-atom" :: [] ->
            Just Science_IdeaOfAtom

        "science" :: "neutrino" :: [] ->
            Just Science_Neutrino

        "science" :: "oldest-tree" :: [] ->
            Just Science_OldestTree

        "science" :: "periodic-table" :: [] ->
            Just Science_PeriodicTable

        _ ->
            Nothing


href : Path -> Html.Attribute msg
href path =
    Html.Attributes.href (toString path)


toString : Path -> String
toString path =
    let
        pieces : List String
        pieces =
            case path of
                Home_ ->
                    []

                About ->
                    [ "about" ]

                Apps ->
                    [ "apps" ]

                Apps_DrumMachine ->
                    [ "apps", "drum-machine" ]

                Apps_RandomExchangeModel ->
                    [ "apps", "random-exchange-model" ]

                Art_ExperimentChatgpt ->
                    [ "art", "experiment-chatgpt" ]

                Counter ->
                    [ "counter" ]

                Photos ->
                    [ "photos" ]

                Photos_NYC ->
                    [ "photos", "n-y-c" ]

                Photos_Paris ->
                    [ "photos", "paris" ]

                Science ->
                    [ "science" ]

                Science_Atoms ->
                    [ "science", "atoms" ]

                Science_Champagne ->
                    [ "science", "champagne" ]

                Science_CreationAndAnnihilation ->
                    [ "science", "creation-and-annihilation" ]

                Science_Entropy ->
                    [ "science", "entropy" ]

                Science_IdeaOfAtom ->
                    [ "science", "idea-of-atom" ]

                Science_Neutrino ->
                    [ "science", "neutrino" ]

                Science_OldestTree ->
                    [ "science", "oldest-tree" ]

                Science_PeriodicTable ->
                    [ "science", "periodic-table" ]

                NotFound_ ->
                    [ "404" ]
    in
    pieces
        |> String.join "/"
        |> String.append "/"
