module Pages.Science.Champagne exposing (Model, Msg(..), page)

import Components.Sidebar as Sidebar
import Effect exposing (Effect)
import Element exposing (..)
import Page exposing (Page)
import PageHelper.Element
import Render.Msg exposing (MarkupMsg)
import Route exposing (Route)
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
    { window : { width : Int, height : Int }
    , routeString : String
    }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.window, routeString = "/science/champagne" }, Effect.none )


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


view : Model -> View Msg
view model =
    Sidebar.view
        { title = "Jim's Blog"
        , attributes = []
        , element = PageHelper.Element.article document model.window |> Element.map Render
        }


document =
    { title = "Champagne and the Experimental Method"
    , content = content
    , imageUrl = "https://jxxcarlsonblog.files.wordpress.com/2020/05/winebottle.jpeg"
    , imageDescription = "A glass of champagne"
    , contentHeader = Just contentHeader
    }


contentHeader =
    """
There is a belief, common in France anyway, that the fizziness of an opened bottle of champagne can be preserved by placing a metal spoon, handle down, in the mouth of the bottle. Both my wife and brother-in-law, both French, believe that this a sure way to better enjoy an opened bottle the next morning, or even the morning after that.

But is this belief true? Examining it critically is an excellent, non-technical way of understanding the experimental method. In brief, the method is a way of separating the possibly true from the definitely false. We, as citizens, need to do this just as much as does the scientist in the laboratory.

So let’s have at it. What arguments pro and con are there for the spoon-the-bottle hypothesis? On the pro side of the ledger is that people I know and respect believe the hypothesis. Also in favor is that the belief is shared by many others, and has been around for a long time.  This is a version of the Argument from Authority.

"""


content =
    """
| title

What about the con side?  When I first heard about this use of a spoon — after half-finishing the second bottle of champagne with friends — I objected that “it just didn’t seem right.”  Pressed to explain, I questioned the mechanism: how could the spoon stop bubbles from forming in the liquid below, then escaping though the neck, passing around the spoon, which “obviously” did not form real barrier.

We argued back and forth, but these theoretical arguments failed to convince my drinking companions. To decide the issue, I proposed an experiment.  We would half-drink two more bottles of champagne so as to have three identical bottles, A, B, and C, then proceed a follows:  re-cork bottle A, put a spoon in the neck of bottle B, and do nothing to bottle C.  All would be placed in the refrigerator.  We would test the three bottles the next morning and for two mornings thereafter.

My proposal was accepted, and we set about preparing the experiment.  The next morning, not so many hours after putting the bottles in fridge, there was not much difference among the bottles.  I thought B and C were a bit stale, but my companions disagreed.  The next day there was a considerable difference, with bottles B and C definitely stale, definitely lacking in that bubbly tang.  B and C seemed equally stale. The day after it was clear to all: B and C were quite flat, while A retained its fizzyness.  The spoon had done nothing.

This little tale illustrates the essence of the experimental method in science: formulate a precise question, then design and carry out experiment to answer it.  Nothing more, nothing less.  Simple, effective, and useful in everyday life.

[b One more thing]

There is one more thing.  You do not have to accept my judgement of the spoon-in-the-bottle hypothesis.  Rather than accepting my authority, you can carry out the experiment yourself.  If you get the same results, or similar once, this confirms the hypothesis.  A good experiment is repeatable.
"""
