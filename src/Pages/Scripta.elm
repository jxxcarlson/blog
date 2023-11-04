module Pages.Scripta exposing (Model, Msg(..), page)

import Components.Sidebar as Sidebar
import Effect exposing (Effect)
import Element exposing (..)
import Page exposing (Page)
import Render.Msg exposing (MarkupMsg)
import Route exposing (Route)
import Scripta
import Shared
import View exposing (View)


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { window : { width : Int, height : Int } }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


type Msg
    = Render MarkupMsg


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Render _ ->
            ( model, Effect.none )



-- VIEW


view : Model -> View Msg
view model =
    Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , element =
            row [ centerX, clipY ]
                [ Scripta.katexCSS
                , Scripta.display model.window src |> Element.map Render
                ]
        }


src =
    """
| title
Scripta Test


[vspace 20]

# Introduction

This is a test of the Scripta compiler (as yet unpublished).

The Scripta compiler
transforms text in MiniLaTeX, Markdown, or L0 into HTML. In this
blog we use L0 exclusively.  L0 has block structure where the body of each block
is composed of ordinary text and elements of the form `[function-name a b c ...]`
where `function-name` is the name of a function and `a b c ...` are its arguments:
words separated by spaced. Here is an example:

|| code
This is a [italic really, [bold really]] important theorem.

It renders like this:

This is a [italic really, [bold really]] important theorem.
Many commonly used functions have alias, e.g., `i` for `italic`
and `b` for bold.

# More examples

We take this `TeX` source:

|| code
$$
\\int_0^1 x^n dx = \\frac{1}{n+1}
$$

and render it like this:

$$
\\int_0^1 x^n dx = \\frac{1}{n+1}
$$

The following theorem was known to Euclid:

| theorem
There are infinitely many primes.

# Images

The image below was made by a human (me), talking to an AI (openAI's Dall-E).  It takes
both luck and messing with the prompts to get satisfying results.

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/9afa89fd-821b-4f60-05e0-99bd659fea00/public]

"""
