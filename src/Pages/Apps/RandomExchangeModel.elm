module Pages.Apps.RandomExchangeModel exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaApps as Scripta
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
    ( { window = shared.dimensions, routeString = "/apps/random-exchange-model" }, Effect.none )


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
Random Exchange Model

[vspace 20]
[large [link Link to the App https://jxxcarlson.github.io/app/small-economy/index.html]]

[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/fc14f42e-a1de-4df9-662b-24f73f1c8a00/public Figure 1. Simulation: Click image to enlarge]

[i Above: a simulation of the random exchange model at [link jxxcarlson.gihub.io https://jxxcarlson.github.io/app/small-economy/index.html]. Type one-letter commands like [b i] to set the tax rate to 20%, [b n] for no taxes, etc.]

# Introduction

The Random Exchange Model is a simplified way to think about the distribution of wealth or resources in a population. Imagine a room full of people, each starting with the same amount of money, say [dollar]10. Every minute, two people are chosen at random, and one gives the other [dollar]1.

The interesting part is how money gets distributed over time. You might expect that everyone would end up with roughly the same amount of money they started with, but that's not what happens. What tends to occur is a distribution where most people have a moderate amount of money, some people are quite poor, and a few are very wealthy. This distribution can look surprisingly similar to real-world wealth distributions.

The distribution of wealth or income predicted by this
model is the [i Boltzmann distribution] introduced in the
late 19th century by the German physicist Ludwig Boltzmann:
the probability that a molecule in gas is found with energy $E$ is

|| equation
p(E) \\propto e^{-E/kT}

where $k$ is a constant and $T$ is the absolute temperature[footnote The absolute temperature is the temperature measured in degrees Kelvin.  The degrees are like degrees Centigrade, except that zero degrees Kelvin is
-273.16 degrees Centigrade.  The Boltzman (or Boltzmann-Gibbs) distribution has many applications, both in physics and the social sciences.]. In the context of models of wealth the distribution is

|| equation
p(w) \\propto e^{-w/\\left<w\\right>}

where $w$ is wealth and $\\left<w\\right>$ is a measure of
average wealth.  Thus average wealth is analogous to temperature.




# Relation with Kinetic Theory

Imagine a gas — the air in the room you are sitting in for
example.  It is made of vast numbers of molecules which
travelling at high speed in random directions and speeds.
From time to time two molecules will collide, then bounce
off in different directions and speeds.  Because these
collisions are not pefectly elastic, energy is exchanged
during these collisions.  As a result, some molecules are
speeded up, whereas others are slowed down.  The molecules
in the gas take on a wide range of velocities and therefore
a wide range of energies.  To reach a high energy state,
a molecule must receive a majority of "kicks" from other
collisions.  This is less likely that a random assortment of
collisions.  Consequently it is less likely for a molecule
to be in a high energy state than a low one.  The law
governing these probabilities is the [term Boltzmann
distribution].

As noted, in the random exchange model,
wealth is somewhat like energy: the former is exchanged through
interactions between individuals, whereas the latter is exchanged by collisions betwween particles.


# Evidence and Controversy

We all know an individual picked at random is more likeyto have lower wealth than the opposite.  There are many fewer
billionaires than there are teachers, scientists or plumbers.
But what is the quantitative law (if any) that governs
the distribution of wealth or income?  The random exchange
model makes an assertaion about this law, and it is backed
by strong observational evidence [cite DY].

Despite the good agreement with observation, the random exchange model is controversial.  Economists are skeptical because,
among other things, the exchange of wealth has nothing
to do with the agency of any of the persons or entities
treated by the model.  Just as the molecules in a gas,
the "agents" in the random exchange model act blindly and
unknowingly.  In a word, the dispute is not about the agreement with data, but with the [i mechanism][footnote This is remiscent of another story in the history of science.  The ancients, e.g. Ptolemy (second century AD), had developed mathematical models of the heavens which enabled them to predict celestial events, e.g. eclipses and the opposition of Jupiter, with what for the times was excellent accuracy.  Their model of the heavens placed the Earth at (or near) the center.  As we all learned in school, Copernicus initiated an intellectual revolution with a sun-centered model.  Less well-known is that he retained the mathematical methods of Ptolemy, namely his epicycles.  These were needed for accuracy.  In any case, the point is that science is not all about agreement with data.  It is also about uncovering the correct mechanism. That is to say,
the goal of science is to understand Nature.  Agreement of theory with data is necessary but not sufficient.].


# A Simulation



Suppose that we have a system with equally spaced energy  levels $E_j$, where with spacing is $\\Delta E$. Then the ratio of probabilities is

|| equation
\\frac{P(E_{j+1})}{P(E_j)} = e^{-k\\Delta E}

That is, the ratio of probabilities for occuping adjacent
energy levels is the fixed constant $e^{-k\\Delta E}$.

Now suppose that
we have data for different energy levels or income strata organized as layers
or percentiles.  If the ratios of the occupation numbers for these
layers or or percentiles are independent, or nearly independent of the layer/stratum, we have evidence for a Boltzmann-like distribution.


Below is data by quintile for a small run of the random exchange model simulated in reference (4) below and displayed
in the image at the beginning of this article.

[vspace 10]

|| code
Quintile 5   24.0
Quintile 4   13.2
Quintile 3    7.5
Quintile 2    3.8
Quintile 1    1.3

[vspace]

The successive ratios from top to bottom are 1.82, 1.76, 1.97,
2.9.  The ratios, except for the last are close to 1.8.
This is rough evidence for a Boltzmann or Boltzmann-like distribution.  To investigate further one should
examine these ratios for much longer runs of the model.

| endnotes

# References

[bibitem CC1] [link Kinetic Exchange Models for Income and Wealth Distributions (Arnab Chatterjee, Bikas K.  Chakrabarti, 2007) https://arxiv.org/abs/0709.1543]

[bibitem CC2] [u Econophysics of Wealth Distributions: Econophys-Kolkata I], by Arnab Chatterjee (Editor), Sudhakar Yarlagadda (Editor), Bikas K. Chakrabarti (Editor)

[bibitem SC] Random exchange models and the distribution
of wealth, Enrico Scalas, Eur. Phys. J. Special Topics 225, 3293–3298 (2016) — [link PDF from  Springer Link . https://link.springer.com/article/10.1140/epjst/e2016-60162-3]



[bibitem DY] Evidence for the exponential distribution of
income in the USA, European Physics Journal B, 20 585-589 (2001)

[bibitem JC] [link An online simulation of the exchange model https://jxxcarlson.github.io/app/small-economy/index.html]

[bibitem YA] [link Victor Yakovlenko: What Causes Inequality? An Econophysics Approach (YouTube) https://www.youtube.com/watch?v=aBxjrAjrIZY]



"""
