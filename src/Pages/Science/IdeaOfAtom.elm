module Pages.Science.IdeaOfAtom exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaScience as Scripta
import Effect exposing (Effect)
import Html exposing (Html)
import Page exposing (Page)
import Route exposing (Route)
import Shared
import View exposing (View)


type alias Model =
    Blog.Model.Model


type alias Msg =
    Blog.Msg.Msg


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Blog.Msg.Render _ ->
            ( model, Effect.none )


view window model =
    Scripta.view content window model


page : Shared.Model -> Route () -> Page Model Msg
page shared route =
    Page.new
        { init = init shared route
        , update = update
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }



-- INIT


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/science/idea-of-atom" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


content =
    """
| title
The Idea of Atom, Part I

[vspace 40]
[red [large [b D R A F T]]]
[vspace 20]


# Leucippus and Democritus

The idea of atom goes back to the Greek
philosophers Leucippus and Democritus who lived in the
5th century BC.  They reasoned that if you keep cutting
a piece of matter in half, you will eventually reach a
smallest piece that cannot be cut any further.  They called
these pieces [i atomos], which means "uncuttable."

As we shall now know, the idea of atom
in this form is not correct. Atoms are not
indivisible, but instead composed
of smaller parts — protons, neutrons, and electrons.
A narrow reading
would say that the idea of Leucippus and Democritus
was incorrect and was therefore a failed attempt to explain the
nature of matter. But in fact, this idea guided
over two millennia of thought and experiment that
led to our current understanding of matter. Although
incorrect in its details, the idea was a
powerful tool for scientific progress, fruitful
in its many consequences and applications.

# From Aristotle to Alchemy

Aristotle, who lived in the 4th century BC,
rejected the idea of atom, asserting instead that matter is 
continuous, and so can be divided into smaller and smaller parts
without limit.  His theory of matter was that all things
were composed of just four
elements in varying proportions: earth, air, fire, and water.  These elements
were continuous substances that
could be transformed into one another under certain
conditions.  For example, water could be transformed
into air by evaporation — not a totally crazy idea,
since that is what seems to happen.  As the pre-eminent philosopher of
ancient times, Aristotle's ideas dominated Western thought
for over two millennia.


Parallel to the speculations of the philosophers was the practice
of alchemy, which in the West we can trace from the Hellenistic
era (XX-XX) through the Golden Age of Islam (8th - 14th century)
and into medieval Europe.  Alchemy was  a mixture of spiritual quest, search for ultimate knowledge,  and experimentation, e.g. the search for a way to turn base metals like lead into gold.
Though base metals were never turned into gold, the alchemists
built up an impressive knowledge of what we would now call chemical recipes, reactions, and procedures.
They knew about many ores
and how to extract metals from them — among which gold, silver, mercury, lead, and tin.  Consider, for example, the
mineral cinnabar, pictured below, used
in ancient times as a pigment


[image https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Cinnabarit_01.jpg/800px-Cinnabarit_01.jpg width:300 caption:Cinnabar (HgS)]

Cinnabar is what we know now a mercury sulfide (text{HgS}$),
a compound of the elements mercury ($\\text{Hg}$) and ($\\text{S}$).


One of the alchemical processes was to grind cinnabar into
a power, heat it in a furnace, and cool off the resulting gases.  As the gases cooled, they condensed, forming a
shiny metallic liquid, just as water vapor (a gas) condenses on
a cold surface to form droplets liquid water. The liquid was a substance they called mercury.  In this way
 mastered the transformation

|| equation
\\label{cinnabar-heating-simple}
\\text{Cinnabar} \\to \\text{Mercury}


The alchemists also mastered what was in essence the reverse
reaction:

|| equation
\\label{mercury-to-cinnabar}
\\text{Mercury} + \\text{Sulfur} \\to \\text{Cinnabar}

Liquid mercury was mixed with powdered sulfur, then heated.
The result was powdered Cinnabar.

You might wonder why
they decided to do this.  One possibility is that they
were just puttering around in their laboratory, trying
random ingredients to see what they could get.  Perhaps
the philosopher's stone, which was, along with gold,
one of their objectives.  But there is another posssibility.
The substances used in alchemy often had a symbolic meaning.
In alchemy, mercury was often associated with the principle of
the mind or spirit, while sulfur was associated with the
soul or life force. Combining these two substances had not
just a physical but also a symbolic meaning,
representing the unification of opposing principles.
Something interesting was sure to result.

Whatever the motivation of the alchemists, their experimentation
provided good raw material for the next phase.



# From Dalton to Chemistry

Beginning in the early years of the
19th century, the English scientist John Dalton
(1766-1844) revived the ideas of
Leucippus and Democritus, asserting that

. Elements are composed of small particles called atoms.

. All atoms of a given element are identical in mass and properties.

. Compounds are formed by a combination of two or more different kinds of atoms.

. A chemical reaction is a rearrangement of atoms.


Using these principles, Dalton and his successors were
able to explain many of the observations of the chemists
and the alchemists before them, as well as and to make predictions that were confirmed by experiment.

[b Roasting Mercury and Sulfur]

Consider, for example, the alchemical process of
roasting mercury and sulfur. Following Dalton's principle (1)
and (3),
a pool of liquid
mercury is a collection of identical mercury atoms ($\\text{Hg}$)
just as a pile of sulfur powder is a collection of
identical sulfur atoms $\\text{S}$.  We ask: what is
the atomic counterpart of the process that transforms
mecury and sulfur to cinnabar?  Well, it is the reaction
below, where we do not yet know what to put on the
right-hand side.



|| equation
\\text{Hg} + \\text{S} \\to \\text{?}


But Dalton's principle (4) gives the answer.  It is
som rearangment of mecury and sulfur atoms.  The
combination of $\\text{HgS}$ is the only possibility.[footnote ... well ...].  Thuse we have

|| equation
\\text{Hg} + \\text{S} \\to \\text{HgS}

[b Burning Cinnabar]

What about the reaction in which we heat cinnabar?
This is more complicated.  Perhaps it is

|| equation
\\text{HgS (solid)}  \\to \\text{Hg} (\\text{liquid}) + \\text{?}(\\text{gas})

If that is so, then the missing ingredient on the right
is sulfur.  But we find no traces of sulfur powder in
our apparatus in which we cool the gases
coming off the hot cinnabar.  There is something else we
can do.  We weigh the cinnabar before we heat it, and we weigh
the mercury that we collect. If we start with 100 grams of
cinnabar, we collect 90 grams of mercury[footnote Well, ....].
So where is the 10 grams of sulfur that we produced?  This is
enough sulfur to be noticeable.

There is another possibility.  Maybe the reaction is really

|| equation
\\text{HgS (solid)}  + X(\\text{gas}) \\to \\text{Hg} (\\text{liquid}) + \\text{S}X(\\text{gas})

for some unknown moleculue $X$.  Here we are using (4)
plus the assumption that the rearrangemen of atoms
is the simplest possible.  We put all the atoms in $X$
on the left with the sulfur atom on the right.

That is, maybe the cinnabar on the left is combining
with a gas in the air?  If we are lucky enough to
know already that the air is largely a mixture of
oxygen gas ($\\text{O}_2$) and nitrogen ($\\text{N}_2$), then
we have a good starting point.  If $X = \\text{O}_2$,
then the reaction is



|| equation
\\label{cinnabar-heating}
\\text{HgS (solid)} + \\text{O}_2(\\text{gas}) \\to \\text{Hg} (\\text{liquid}) + \\text{SO}_2(\\text{gas}),

The unknown reaction product on the right is sulfur dioxide.
We can detect its presence with moistened litmus paper:
it will turn red litmus paper blue.  Blue litmus paper
turns red in the presence of acids, so any gas
that dissolves in water to form an acid
will will turn blue litmus paper red.  We don't
have a proof that the mystery gas is sulfur dioxide,
we do have strong evidence that it is —\u{00A0}it is in any
case an acidic gas containing sulfur.
that the right-hand product is sulfur .

# Some Conclusions

Notice the long and winding path from the ideas of
Leucippus and Democritus to the modest beginnings
of chemistry as a science.  Just think of the many ingredients —\u{00A0}ideas,  experiments, processes, invention of equipment and
technique —\u{00A0}went into answering the question [i What happens when you burn cinnabar?] We described just part of an idealized
version of how this might have taken place, skipping all
of the attempts that led nowhwere.  And think of the time
elapsed: millennia since the ideas of Leucippus and Democritus,
centuries since the tinkerings of the alchemists ...

In addition to a brilliant idea (the atom), there were many
guesses, often wrong, some right.  Whether right or wrong,
they played a role in taking the next step, formulating
an experiment that could potentially bring greater clarity.
We also see that the knowledge needed to establish even
something as simple as the formula
$\\text{HgS} + \\text{O}_2 \\to \\text{Hg}  + \\text{SO}_2$
is more like a web than a simple linear narrative. (...XXX... )
"""
