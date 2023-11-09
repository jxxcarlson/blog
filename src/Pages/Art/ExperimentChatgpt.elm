module Pages.Art.ExperimentChatgpt exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.Scripta as Scripta
import Effect exposing (Effect)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


type alias Model =
    Blog.Model.Model


type alias Msg =
    Blog.Msg.Msg


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/art/experiment-chatgpt" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Blog.Msg.Render _ ->
            ( model, Effect.none )


view : { width : Int, height : Int } -> Model -> View Blog.Msg.Msg
view window model =
    Scripta.view content window model


content =
    """
| title
Art: Experiments with ChatGPT

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/37615bff-b1d1-43d8-6ce3-adcf1ddfb600/public]

The past few weeks I’ve been drawn to experiment with GPT, asking it to help
write or revise or make poems, songs, and code, talk about physics, etc.
Yesterday, I decided to make a little app to make images using GPT.
The app, [link imagemachine.io https://imagemachine.io/], is written in [link Elm https:elm-lang.org], a pure functional
language that compiles to JavaScript.
It talks to Dall-E suing openai.com’s API.

Part of the idea was to help generate ideas for paintings —
not something to copy, but inspiration for
composition, palette, texture, etc  — at the very least
something to force me out of my habitual same old same old.

The image above is one such, made with this prompt to Chat GPT:
[i Abstract painting with a Japanese feel. Use a combination
of muted earth tones,  warm grays, yellow-greens, and greens,
with some intense blues. Vary the color within the shapes.
Allow some blending of color between shapes.
High key with occasional dark values.]


[b [large Gallery]]

Below are a few more images generated this way, followed by the prompt used to make it.

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/0620e881-a0ff-4fd2-f26a-e1665eaee700/public width:500]

[b Prompt:] [i abstract painting in the style of Georges Braque.
Use a combination of muted earth tones and warm grays,
with reds, oranges, and yellows]

[vspace 20][hrule][vspace 20]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/9b11135d-7ebd-42d1-2a30-cdda845f3200/public width:500]

[b Prompt:] [i abstract painting blending styles of Klee and Money, earth tones and blues.]


[vspace 20][hrule][vspace 20]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/d97524f1-f136-435b-622d-737c56c2cd00/public width:500]

[b Prompt:] [i abstract painting with warm grays and cool grays, some black.]
"""
