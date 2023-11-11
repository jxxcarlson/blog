module Pages.Science.OldestTree exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaScience as Scripta
import Effect exposing (Effect)
import Page exposing (Page)
import Route exposing (Route)
import Shared


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
    ( { window = shared.dimensions, routeString = "/science/oldest-tree" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


content =
    """

| title
The Oldest Tree


[vspace 40]
At an elevation of 10,000 feet in the White Mountains of California there lives the oldest tree known to science: a bristlecone pine tree that sprouted from a seed 4,855 years years ago, in 2832 BC.  By comparison, the oldest pyramid in 
Egypt, that of King Djoser, dates to around over a century later, around 2870 BC.

[image https://ciorg.imgix.net/images/default-source/non-vault-images/gnarly-bristlecone-pine.jpeg?sfvrsn=67b1b1ba_1?&auto=compress&auto=format&w=800 caption:Methuselah tree width:fill]


This is a remarkable claim.  How on earth can we
know such things?  The short answer is 

| indent
[i Use carbon 14 dating].

Let's dive in and try to understand what the technology 
of carbon 14 dating is, the science behind its development, and how it is used
to find the age of trees and archaeological artifacts.


# The Carbon Atom

Like many science and technology stories, the
plot line is not a straight one. It begins with
the discovery of the atom, the realization that
it is made of still smaller particles,
and the discovery of radioactivity.

To begin, lets think
about the carbon atom. Like all atoms, it consists of protons,
neutrons, and electrons.  The protons and neutrons
are "fat" particles that weigh almost the same, and weigh
about 2000 times as much as the electrons.  The protons and
neutrons are packed tightly together in a place called the
[i nucleus] of the atom, while the electrons hover around
the nucleus in a kind of cloud. (See figure below).
Each of these particles carries an electric charge:
+1 for the proton, 0 for the neutron, and -1 for the electron.
Normal atoms have as many electrons as they do protons,
so the total charge is zero: they are electrically neutral.
The most common kind of carbon atom has 6 protons,
6 neutrons, and 6 electrons.  We call it "carbon 12,"
because that is the number of particles in the nucleus.
99% of the carbon in the air we breathe is made of up of
carbon 12, where it forms part of carbon
dioxide molecules ($\\text{CO}^2$). Plants
turn the carbon dioxide into leaves, grains, fruit and wood,
and animals eat the plants.
When we burn wood or plants and animals die and decompose,
the carbon dioxide is released back into the air.
The great cycle of life.





[image https://www.pathwayz.org/Node/Image/url/aHR0cHM6Ly9pLmltZ3VyLmNvbS90Y0lqVkFzLnBuZz8x width:fill]


[b The other 1%]

What about other one percent of the carbon in the atmosphere?
It consists of carbon 13 and carbon 14.  Both have 6 protons and 6 electrons,
but the first has 7 neutrons while the second has 8.  Carbon 13 is accounts
for almost all of the remaining carbon, while carbon 14 accounts for just
just one part in a trillion.  We call these different forms of carbon
[i isotopes].  Because the electrons determine the chemical properties
of an atom,  the various isotopes are chemically identical.
But carbon 13 is about 1/12th (8.6%) lighter
than carbon 12, and carbon 14 is about 2/12ths (6.7%) heavier.


# Radioactive Decay

There is something odd about the carbon 14 isotope:
it is [i unstable].  This means that every now and then
it "loses its mind,"  and one of its neutrons turns into a proton plus an electron plus a very very light particle 
called an antineutrino. The electron and the antineutrino
go whizzing out of the atom at high speed.  The electron
is very energetic, and is considered a form of radiation. 
If it crashes into our body, it can damage our cells.

Let's figure out 
what is left behind.  Carbon 14 has 6 protons, 8 neutrons, and 6 electrons (to balance the protons).  One of the neutrons turns into a proton plus the lighter particles that go whizzing off.  So now the atom has 7 protons, 7 neutrons, and 6 electrons.  It looks like a Nitrogen atom, because it has the right number of protons to be one.  But it is an
atom out of balance: one more proton than electrons.
As a result, it is positively charged. Instead of neutral 
nitrogen 14 atom, we have a positivel change nitrogen ion which we write as
$N^+$.  So the full reaction is

|| equation
{}^{14}_6\\text{C} \\to {}^{14}_7\\text{N}^+ + e^{-} + \\bar{\\nu}

The numbers on top give the number of neutrons + protons,
while the numbers on the bottom give the number of protons.
The ejected electron is also called a [i beta] particle.

The process we just described is a form of [i radioactive decay] called [i beta decay].

[b Remark.] [i On earth, ions  exist mostly in special environments, e.g., sodium
and chlorine ions in seawater (from the dissolved salt) or for brief instants of time
in chemical reactions.  The vast majority of atoms are electrically neutral.
But the sun is different. Its central core has a temperature of about
15 million degrees centigrade (27 million degrees Fahrenheit). The core
consists almost entirely of hydrogen ions  — free protons — along with some helium ions.
This state of matter is neither solid, liquid, or gas: it is a [u plasma].
Because of the high temperature and huge pressures at the core, hydrogen
atoms fuse to form helium. This reaction releases energy, powering the source
of light and heat which makes life on Earth possible.]


# When Does a Carbon 14 Atom Decay?

We said that carbon 14 atoms sometimes "lose their mind"
and "from time to time" decay into nitrogen 14.
This raises a question:

| indent
[i How long is "from time to time?"]

Well, because of the laws of quantum mechanics,
we can't answer this question.  But we can say what is 
[i expected] to happen to a large number of carbon 14 atoms.
That is, although we can't make predictions about individual
atoms, we do understand the statistics of their "group behavior."

Here is what we know. If we start with a certain number of
carbon 14 atoms, then after
5,730 years, we expect to have just half of the atoms
 we started with.  And after $2\\times  5,730 = 11,460$ years
we would have only a quarter as many.  What about
after 3 half-lives or $17,190$ years?  Well, only 
a quarter as many.

We now come to the main point: 

| indent
[i if we know the half-life of carbon 14, we can use it as 
clock to date artifacts.]

In what follows we will explain enough so that you
could set up your own lab to do carbon 14 dating.

# Determining the Age of a Sample

Here is the idea in more detail.  We know that the fraction 
of carbon 14 in the atmosphere is one one-trillionth
of all the carbon in the atmosphere.  Let's take a sample
of wood and roast it so that all we have is charcoal: pure carbon!  By weighing the sample, we can determine the
number of carbon atoms it contains. If the sample
is fresh, newly-made wood, one one-trillionth of the 
atoms consist of carbon 14.  Let's imagine that 
we measure out one gram of sample carbon, then measure
the number of radioactive decays per minute using a Geiger
counter.  A Geiger counter has a special vacuum tube 
which is sensitive to beta rays.  Each time it detects
one, it makes a click.  So we measure the number 
of clicks per minute.  This, the number of clicks
per minute in a one-gram fresh sample is our
[i base rate].  We write it down in our lab notebook.
Let's imagine that the base rate is 123 clicks per minute.

[i Now imagine that someone brings usa sample of wood
and says: this comes from a very old tree.
Can you tell me how old it is?]

We heat the sample to turn it into charcoal, measure
out one gram of it,  put it in our detector, and 
start counting clicks.  The clicks come at irregular intervals,
but after an hour we find that the number of clicks
is one-half the base rate — the number of clicks that we get with
a fresh sample.  Aha! We conclude that there is just half as much carbon 14
as in a fresh sample.  That means that one half-life of carbon 14 has elapsed since the wood was formed by a live
tree.  The wood is 5,730 years old.


[b A Formula]

Ordinarily we would not be so lucky as to find exactly 
one-half the base rate of clicks.  But a little math will
give us what we want.  Let $c_0$ be the base rate: the number
of clicks per minute in a fresh one-gram sample. 
Let $c$ the be click rate for our sample.  Let $a$ be
the age of the sample.  Then 

|| equation
a = 5730 \\log_2(c_0/c)



In our example, the ratio of base rate to sample rate is
2, and $\\log_2 2 = 1$, so this checks: the age of the sample
is 5,730 years. To be compatible with standard calculators,
we write our formula in terms of base 10 logarithms:

|| equation
a = 3.32 \\times 5730 \\log_{10}{c_0/c}

Suppose a specimen we analyzed gives a click rate of 22 per minute compared to the base rate of 123 per minute.
Suppose a specimen we analyzed gives a click rate of 22 per minute compared to the base rate of 123 per minute.
Then $c_0/c = 5.6$ and so

|| equation
a = 3.23 \\times 5730 \\times \\log_{10} 5.6 = 13,847 \\text{ years}

[b Limitations]


The method just described can determine the age
of a sample up to about 60,000 years.  This number is
roughly 10 half-lives.  After this much elapsed time, the amount of carbon-14
relative to its initial amount is one-half raised to
the tenth power — 1/1024, or about 0.1 percent.
One has to have enough carbon 14 to get an accurate
measure of the click rate.

# Something missing in the argument?

According to what was just said, after 10 half-lives
only 0.001 of the original carbon-14 remains. And a
after 20 half-lives, only $0.000001 = (0.001)^2$ would remain.
So if there is any carbon 14 for plants to take up 
from the air and turn into wood, there must be a source of carbon 14 — something that creates it continously in the atomosphere.  And there is indeed a source: cosmic rays.  Cosmic rays are high-energy particles or clusters of particles, mainly protons that move through space at nearly the speed of light. They originate from the Sun, other ordinary stars, supernova, and black holes, many from outside our galaxy. 

Here, in more detail is what happens.  When a 
high-energy proton smashes into an atom in the 
atmosphere, it sometimes knocks out a neutron.
If that neutron collides with nitrogen-14 in just
the right way, it will stick to the nitrogen atom
and knock out a proton.  So the nitrogen 14 atom has
one more neutron and one less proton:

|| equation 
n + {}^{14}_7\\text{N} \\to {}^{14}_6\\text{C} + p

This is how carbon 14 is created.  By and by the 
transmuted carbon 14 atom joins with an 
oxygen molecule $\\text{O}^2$ for form $\\text{CO}^2$ — carbon dioxide.  Plants take up the carbon dioxide to form new cells, and, in particular to form wood. 



[vspace 50]
[b Links]

[link U Chicago News: Carbon 14 dating https://news.uchicago.edu/explainer/what-is-carbon-14-dating#:~:text=Carbon%2D14%20has%20a%20half,in%20that%20amount%20of%20time.]
"""
