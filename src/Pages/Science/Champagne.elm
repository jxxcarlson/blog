module Pages.Science.Champagne exposing (page)

import Components.Sidebar as Sidebar
import Element exposing (..)
import Element.Font as Font
import View exposing (View)


page : View msg
page =
    --let
    --    foo =
    --        shared.window.width
    --in
    Sidebar.view
        { title = "Science.Champagne"
        , attributes = []
        , element = article "Champagne and the Experimental Method" text
        }


article : String -> String -> Element msg
article title_ content_ =
    column [ spacing 24, paddingXY 24 24 ]
        [ title title_
        , header header_
        , compile content_ |> column [ Font.size 14, spacing 12, width (px 500) ]
        ]


header_ =
    { content = "There is a belief, common in France anyway, that the fizziness of an opened bottle of champagne can be preserved by placing a metal spoon, handle down, in the mouth of the bottle. Both my wife and brother-in-law, both French, believe that this a sure way to better enjoy an opened bottle the next morning, or even the morning after that.\n\nBut is this belief true? Examining it critically is an excellent, non-technical way of understanding the experimental method. In brief, the method is a way of separating the possibly true from the definitely false. We, as citizens, need to do this just as much as does the scientist in the laboratory.\n\nSo let’s have at it. What arguments pro and con are there for the spoon-the-bottle hypothesis?"
    , imageUrl = "https://jxxcarlsonblog.files.wordpress.com/2020/05/winebottle.jpeg"
    , imageDescription = "A glass of champagne"
    }


header : Header -> Element msg
header headerData =
    row [ spacing 12 ]
        [ image [ width (px 250) ] { src = headerData.imageUrl, description = headerData.imageDescription }
        , column [ width (px 250), alignTop ]
            [ column [ Font.size 14, spacing 12 ] (compile headerData.content)
            ]
        ]


type alias Header =
    { content : String
    , imageUrl : String
    , imageDescription : String
    }


title : String -> Element msg
title str =
    el [ Font.size 24 ] (Element.text str)


compile : String -> List (Element msg)
compile str =
    List.map transform (String.split "\n\n" str)


transform : String -> Element msg
transform str =
    if String.left 12 str == "@subheading " then
        paragraph [ Font.bold ] [ Element.text (String.dropLeft 12 str) ]

    else
        paragraph [] [ Element.text str ]


text =
    """
On the pro side of the ledger is that people I know and respect believe the hypothesis. Also in favor is that the belief is shared by many others, and has been around for a long time.  This is a version of the Argument from Authority.

What about the con side?  When I first heard about this use of a spoon — after half-finishing the second bottle of champagne with friends — I objected that “it just didn’t seem right.”  Pressed to explain, I questioned the mechanism: how could the spoon stop bubbles from forming in the liquid below, then escaping though the neck, passing around the spoon, which “obviously” did not form real barrier.

We argued back and forth, but these theoretical arguments failed to convince my drinking companions. To decide the issue, I proposed an experiment.  We would half-drink two more bottles of champagne so as to have three identical bottles, A, B, and C, then proceed a follows:  re-cork bottle A, put a spoon in the neck of bottle B, and do nothing to bottle C.  All would be placed in the refrigerator.  We would test the three bottles the next morning and for two mornings thereafter.

My proposal was accepted, and we set about preparing the experiment.  The next morning, not so many hours after putting the bottles in fridge, there was not much difference among the bottles.  I thought B and C were a bit stale, but my companions disagreed.  The next day there was a considerable difference, with bottles B and C definitely stale, definitely lacking in that bubbly tang.  B and C seemed equally stale. The day after it was clear to all: B and C were quite flat, while A retained its fizzyness.  The spoon had done nothing.

This little tale illustrates the essence of the experimental method in science: formulate a precise question, then design and carry out experiment to answer it.  Nothing more, nothing less.  Simple, effective, and useful in everyday life.

@subheading One more thing

There is one more thing.  You do not have to accept my judgement of the spoon-in-the-bottle hypothesis.  Rather than accepting my authority, you can carry out the experiment yourself.  If you get the same results, or similar once, this confirms the hypothesis.  A good experiment is repeatable.
"""
