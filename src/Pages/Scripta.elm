module Pages.Scripta exposing (Model, Msg, page)


import Config
import Element.Font as Font
import Page exposing (Page)
import Element exposing(..)
import View exposing (View)
import Render.Msg exposing (MarkupMsg)
import Scripta
import Components.Sidebar

page : Page Model Msg
page =
    Page.sandbox
        { init = init
        , update = update
        , view = view
        }



-- INIT


type alias Model =
    {}


init : Model
init =
    {}



-- UPDATE


type Msg
    = Render MarkupMsg


update : Msg -> Model -> Model
update msg model =
    case msg of
        Render _ -> model



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view
     { title = "Scripta"
     , attributes = []
     , element = row [centerX] [
          Scripta.katexCSS
        , Scripta.display Config.articleWidth  700 src |> Element.map Render
     ]
     }


src = """
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