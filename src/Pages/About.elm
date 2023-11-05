module Pages.About exposing (Model, Msg(..), page)

import Components.Sidebar
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
    Components.Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , element =
            row [ centerX ]
                [ Scripta.katexCSS
                , Scripta.display model.window src |> Element.map Render
                ]
        }


src =
    """
| title
About this blog

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/71c96394-214f-4607-7853-4f6bd1f88b00/public]

|| hide
[image https://jxxcarlsonblog.files.wordpress.com/2020/04/ganymede_sepia.jpg]

This blog is a collection of random musings, writings, images,
 and occasional rantings which provides me with a kind of searchable notebook.
 I like to think of it as a magical box full of sheets of manuscript paper written
 in longhand, mostly in pencil, where each sheet can be found in an instant by
 pronouncing the correct google-like spell.  The blog is therefore primarily
 for myself, though others may occasionally find something of interest.

About the image above.  It presents a view of Ganymede,
not the lover of Zeus, but rather the third and largest
moon of Jupiter. You can find the original at the US Geological Survey.
This version has been processed several times, first for
square-the-circle.com, an old blog of mine, and more recently for this page.

Why an image of Ganymede? The real reason is for no particular reason
at all, though of course one can find many after the fact. It was convenient,
and I could crop it to a 9:2 aspect ratio, so it would serve well as a
header for this document.  Or, I could say that it represents man’s drive to
explore, to forge into the unknown, whether in the physical world or the world of ideas.
But, returning to a more honest plane of discourse, it was simply a random choice,
a way of pleasantly filling space.

[vspace 30][hrule]

The text of the articles here is
written in the [i Lambda] markup language
and is rendered by the [i Scripta] compiler
See below for more details. See also  [link Scripta.io https://scripta.io/].

[vspace 15]
[b [large The Scripta Compiler]]

The Scripta compiler transforms markup text into HTML.
The markup languages it handles are MiniLaTeX (like LaTeX),
XMarkdown (like Markdown), and Lambda, a simple markup language
whose syntax is inspired by Lisp, but with square brackets
in place of parentheses.  Most articles in this blog
are written in Lambda.


Lambda has block structure where the body of each block
is composed of ordinary text and elements of the form `[function-name a b c ...]`
where `function-name` is the name of a function and `a b c ...` are its arguments:
words separated by spaces. Below is an example with a quotation block:

|| code
| indent
[italic This is a [italic really, [bold really]] basic theorem.]

It renders like this:

| indent
[italic This is a [italic really, [bold really]] basic theorem.]


Many commonly used functions have alias, e.g., `i` for `italic`
and `b` for `bold`.

[vspace 15]
[b [large Mathematics]]

Scripta can also handle mathematics, as in the following example
which has a `$$` block containing `TeX` source:

|| code
$$
\\int_0^1 x^n dx = \\frac{1}{n+1}


No final `$$` is needed, since Scripta recognizes it as
complete once it sees the trailing blank line.
Here is the rendered text:

$$
\\int_0^1 x^n dx = \\frac{1}{n+1}


The following theorem was known to Euclid.  It is composed
with a theorem block:

|| code
| theorem
There are infinitely many primes.

| theorem
There are infinitely many primes.


[vspace 15]
[b [large Code]]

Scripta handles code with a code block, like this

|| code
|| code
... Your code here ...


Here is an example,
a [i very] crude algorithm for factoring integers into primes:

|| code
factor n = factorHelper n 2 [] |> List.reverse

|| code
factorHelper : Int -> Int -> List Int -> List Int
factorHelper n divisor factors =
  if modBy divisor n == 0
       then factorHelper (n // divisor) divisor (divisor::factors)
  else if n < 2 then factors
  else factorHelper n (divisor + 1) factors


Let's try it out:

|| code
> factor 123456789
[3,3,3607,3803]


[vspace 15]
[b [large Images]]

The image below is
rendered by an [i image element]:

|| code
[image URL]

It was made by a human (me), talking to an AI (openAI's Dall-E) using
[link imagemachine.io https://imagemachine.io/].  Making images likes this takes
both luck and messing with the prompts to get satisfying results.

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/9afa89fd-821b-4f60-05e0-99bd659fea00/public]

"""
