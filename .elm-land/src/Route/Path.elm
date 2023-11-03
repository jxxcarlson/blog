module Route.Path exposing (Path(..), fromString, fromUrl, href, toString)

import Html
import Html.Attributes
import Url exposing (Url)
import Url.Parser exposing ((</>))


type Path
    = Home_
    | About
    | Apps
    | Counter
    | Photos_Paris
    | Science_Champagne
    | Science_ReasonWhy
    | Scripta
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

        "counter" :: [] ->
            Just Counter

        "photos" :: "paris" :: [] ->
            Just Photos_Paris

        "science" :: "champagne" :: [] ->
            Just Science_Champagne

        "science" :: "reason-why" :: [] ->
            Just Science_ReasonWhy

        "scripta" :: [] ->
            Just Scripta

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

                Counter ->
                    [ "counter" ]

                Photos_Paris ->
                    [ "photos", "paris" ]

                Science_Champagne ->
                    [ "science", "champagne" ]

                Science_ReasonWhy ->
                    [ "science", "reason-why" ]

                Scripta ->
                    [ "scripta" ]

                NotFound_ ->
                    [ "404" ]
    in
    pieces
        |> String.join "/"
        |> String.append "/"
