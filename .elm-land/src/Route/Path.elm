module Route.Path exposing (Path(..), fromString, fromUrl, href, toString)

import Html
import Html.Attributes
import Url exposing (Url)
import Url.Parser exposing ((</>))


type Path
    = Home_
    | About
    | Apps
    | Art_ExperimentChatgpt
    | Counter
    | Math_Entropy
    | Photos
    | Photos_NYC
    | Photos_Paris
    | Science
    | Science_Champagne
    | Science_ReasonWhy
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

        "art" :: "experiment-chatgpt" :: [] ->
            Just Art_ExperimentChatgpt

        "counter" :: [] ->
            Just Counter

        "math" :: "entropy" :: [] ->
            Just Math_Entropy

        "photos" :: [] ->
            Just Photos

        "photos" :: "n-y-c" :: [] ->
            Just Photos_NYC

        "photos" :: "paris" :: [] ->
            Just Photos_Paris

        "science" :: [] ->
            Just Science

        "science" :: "champagne" :: [] ->
            Just Science_Champagne

        "science" :: "reason-why" :: [] ->
            Just Science_ReasonWhy

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

                Art_ExperimentChatgpt ->
                    [ "art", "experiment-chatgpt" ]

                Counter ->
                    [ "counter" ]

                Math_Entropy ->
                    [ "math", "entropy" ]

                Photos ->
                    [ "photos" ]

                Photos_NYC ->
                    [ "photos", "n-y-c" ]

                Photos_Paris ->
                    [ "photos", "paris" ]

                Science ->
                    [ "science" ]

                Science_Champagne ->
                    [ "science", "champagne" ]

                Science_ReasonWhy ->
                    [ "science", "reason-why" ]

                NotFound_ ->
                    [ "404" ]
    in
    pieces
        |> String.join "/"
        |> String.append "/"
