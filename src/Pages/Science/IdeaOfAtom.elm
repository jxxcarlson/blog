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

The idea of atom goes back to the Greek
philosophers Leucippus and Democritus who lived in the
5th century BC.  They reasoned that if you keep cutting
a piece of matter in half, you will eventually reach a
smallest piece that cannot be cut any further.  They called
these pieces [i atomos], which means "uncuttable."

As we shall see, the idea of atom is not quite correct.
A narrow reading of the idea of Leucippus and Democritus
would say that it was a failed attempt to explain the
nature of matter. But a broader reading says quite
the contrary: that it is one of the greatest
successes in the history of  science.  While incorrect
in its details (atoms, as we know now, are not indivisible),
and while completely lacking in experimental evidence in
those ancient days (how could it be otherwise?),
the idea of atom has been a powerful tool of thought
and imagination which lead us to some of
the most profound discoveries in physics and chemistry.

# Dalton and the Chemists

Let us recount some of what came after Leucippus and 
Democritus. Aristotle, who lived in the 4th century BC, 
rejected the idea of atom, asserting instead that matter is 
continuous,
and so can be divided into smaller and smaller parts
without limit.  As the pre-eminent philosopher of
ancient times, his ideas dominated Western thought
for millennia.  Happliy, the idea was revived in an 1804 paper by John Dalton who asserted that


. Atoms of a specific element are identical
in size, mass, and properties.

. Chemical reactions involve the rearrangement of atoms.
Atoms are neither created nor destroyed in chemical reactions

. Compounds are formed when atoms of more than one element
combine. A given compound always has the same relative
numbers and types of atoms.

## Electrolysis of Water

Consider the case of water, it is composed
$\\text{H}_2\\text{O}$ molecules: two atoms of hydrogen
and one atom of oxygen, as in Dalton's point (3).
[i But how is it that we know — or can know — this fact?]
A full historical account would take much more space than we have here, so we give an abbreviated explanation that uses
some facts not yet discovered in Dalton's time.


Consider the case the experimental apparatus below.
They key part is the battery, and the two wires 
connecting it to pieces of graphite stuck in the ends
of inverted test tubes which are immersed in a container
of water. As soon as we turn on the current from
the battery, bubbles of gas rise up into the test tubes.
After a while (and each time we repeat the experiment), we
notice something amazing: the height of the column 
of gas in the right test tube is twice the height of
the column of gas in the left test tube.  This is true no matter how much water we use, or how long we run the experiment.  


[image https://www.researchgate.net/publication/273806853/figure/fig1/AS:669021917691910@1536518663356/A-schematic-diagram-represents-the-electrolytic-production-of-hydrogen-gas.png width:300] 


What is going on? The volume gas in the test tubes 
is proportional to the height of the gas column.
So the ratio of volumes, right to left is 2:1.
Let's add one more idea. In 1811, the Italian 
chemist Amadeo Avogadro proposed a new law

| indent
[i Equal volumes of all gases at the same temperature and pressure contain equal numbers of particles.]

If this is so, then the 2:1 ratio is also the ratio
of the number of particles of Hydrogen to the number
of particles of Oxygen.  This suggests, again referring
to Dalton's point (3), that the formula for the water 
molecule is $\\text{X}_2\\text{Y}$, where we don't yet
know what $X$ and $Y$ are — just some random gases.


## Identifying the Mystery Gases

But other experiments showe what $X$ and $Y$ are. 
The gas in the left test tube will make a flame burn more 
brightly, and it will make a glowing splint of wood 
burst into flame.  These are properties of oxygen, a 
substance  first discovered in 1772 by Carl Wilhelm 
Scheele, a Swedish  chemist who obtained it by heating 
substances like potassium nitrate and mercuric oxide.  
So we know Y = O. 

Consider now the right-hand test tube.  The English scientist Henry Cavendish discovered hydrogen as an element in 1766. Cavendish ran an experiment using zinc and hydrochloric acid. He discovered hydrogen and also found that it produced water when it burned.  If we combine the gases of the two test tubes and ignite the
mixture with a small spark, the result will be water 
vapor. We can cool it make liquid water.  So we have identified the remaining gase: X = H, and our mystery
molecule is $\\text{X}_2\\text{Y} = \\text{H}_2\\text{O}$.

## Mass ratios

So far we have considered volume ratios for hydrogen
and oxygen gas.  But we could also consider mass ratios.
To do this we need to have a way of weighing the gas
in a container.  The easiest way is to have two identical
containers A and B.  In A we put the gas to be weighed.
We attach B to a vacuum pump, pump out all the air, 
then close the container.  The idea is that A is full
of gas molecules while B is empty (or almost empty).
We put the two containers on a balance as in (i) in the 
figure below.  Then we put weights on container B until
the the two sides balance.  The weights placed on B
tell us what is the weight the gas in A. 

Beautiful! We do the experiment with A full of hydrogen,
then full of oxygen.  The ratio masses hydrogen:oxygen
is 1:16.  This result tells us the the oxygen atom
is 16 times heavier than the hydrogen atom.

By doing hundreds of experiments like this, 
chemists gradually worked out the mass ratios
of the atoms of the various elements.  It reads
something like this:

|| code
1 Hydrogen   H    1.0
2 Helium     He   4.0
3 Lithium    Li   6.9
4 Beryllium  Be   9.0
5 Boron      B   10.8
6 Carbon     C   12.0
7 Nitrogen   N   14.0
8 Oxygen     O   16.0
. .......   ..   .....

There is a lot of work hidden in this list, and
also hidden patterns and questions to be answered.
One thing to notice is that the numbers in the last
column represent whole numbers to one decimal point
of accuracy with two exceptions: Lithium and Boron.
What is the reason for this? Is it the fault of 
our experiments?  Or perhaps the sample used in the
experiments is not pure — perhaps a mixture of two
things of different weights.  Take Lithium. Maybe
there are two kinds of Lithium, one with mass 7,
the other with mas 6.  If the mixture consists
of 90 percent Lithium 7 and 10 percent Lithium
6, then the average mass of the Lithium in the 
sample is $0.9 \\times 7 + 0.1\\times 6 = 6.9$.
The force is with us: we happened to have guessed just
just the right mixture on the first try.  

We have hit on a possible explanation of the anomalous
numbers.  But our explanation raises another question:
what is the reason for the difference in masses?
The answer comes later, both in this article and 
historically, and has to do with the fact that the atom
is not indivisble. Atoms are made of smaller parts —
the heavy protons and neutrons and the much lighter electrons.  We will discuss this in part II.





# Notes

## Good and Bad Ideas

There a number of lessons to be drawn from this story.
One is that an inspired idea, even if wrong in its details
and unsupported by evidence, can be a powerful force for
progress in science.  As we have seen, such is the 
case with the idea of atom.  It served as a guide 
that eventually did find experimental justification,
elegantly explaining laws such as that of equal mass ratios.

Whether an inspired idea actually works out cannot be judged at the outset.  There was no way for Leucippus and Democritus
to make progress given the state of science and technology 
in the fifth century BC.  But by the the 19th century,
the tools, both for experiment and thought, had developed
to the point that the idea of atom could be tested and used
to explain natural phenomena.

## Phlogiston

Phlogiston is an inspired idea, formulated in the 17th century, that did not work out.
The idea was that flammable materials contained a substance 
called “phlogiston” (from the Greek word for burn) that was 
released during combustion. The theory held that when (for 
example) wood  burns the phlogiston is released from 
the wood into the surrounding air. This seems reasonable:
the ash left behind weighs much less than the wood
before it is set on fire.


It turns out that this in completely wrong, as shown by the French chemist Lavoisier  in 1777.  When the carbon in wood burns, it [i combines] with oxygen to form carbon dioxide.
Thus combustion involves a uniting of substances, not 
a release. 

Lavoisier continued to develop these ideas, and in 
1780 published Traité élémentaire de Chimie (Elements of Chemistry), in which he formulated the law of conservation
of mass:

| indent
[i In a chemical reaction, the mass of the reactants equals the mass of the reaction products.]

In the case of combustion of wood, the reaction is

|| equation
\\text{C} + \\text{O}_2 \\to \\text{CO}_2

The reactants are $\\text{C}$ and $\\text{O}_2$ and there
is a single reaction product, $\\text{CO}_2$.  If we
look at our table, we see that the reactants and
the reaction products have the same mass:
$12 + 2 \\times 16 = 48$.  Lavoisier's law is consistent
with the atomic theory of matter.

[link The Chemical Revolution of Antoine-Laurent Lavoisier (American Chemical Society) https://www.acs.org/education/whatischemistry/landmarks/lavoisier.html#:~:text=The%20prevailing%20theory%20was%20that,it%20to%20the%20surrounding%20air.]

## Alchemy

"""
