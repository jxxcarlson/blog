module Pages.Science.CreationAndAnnihilation exposing (Model, Msg, page)

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
    ( { window = shared.dimensions, routeString = "/science/creation-and-annihilation" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


content =
    """
| title
Creation, Annihilation, and the Neutrino

[image https://jxxcarlsonblog.files.wordpress.com/2020/04/merlin_171584709_5ddc217b-264c-41ac-8bca-8e1b90794d4c-superjumbo.jpg width:fill]

In the beginning, at the instant of creation, there came into being numerous particles:
quarks and antiquarks, protons and and antiprotons, electrons and antielectrons,
each kind paired with its opposite. Thus were matter and antimatter created in equal measure.
But when particle met antiparticle, an exceedingly frequent occurrence in those early times,
the encounter was brief, violent, and almost always fatal, as both were destroyed, their substance
vanishing in a flash of pure energy. When the great annihilation came to an end, there were
few survivors of this many-fold decimation: no more than one in a billion remained.
They were all of one kind, the kind we now call matter.
All that we see about us is made is made of these tiny particles: from the grains of sand on the
seashore to the trees in forest to the sun about which the Earth revolves, to the planets and
the stars, and to the most distant galaxies.

The clue for our improbable and miraculous existence
is hidden in the image you see at the head of this article: an image of muon neutrino traces in a bubble chamber,
the paradoxically huge microscope that physicists use to probe the smallest realms.
In the laws that govern us, it turns out, there is a small asymmetry,
a kind of distinction between right and left, charge and anticharge,
which are otherwise equal mirror images of one another.
Neutrinos, born of the annihilation of particle and antiparticle, of
the explosions of stars which create the iron and nickel of which our earth’s core is made,
of the proton-proton reactions which power our sun,  carry to us the message of this minute
discrepancy, the reason for our existence.


[large [b Notes]]

Neutrinos are ghostly particles that interact very weakly with matter.
The proton-proton reactions that power the sun send out a huge stream of neutrinos.
Each square centimeter of the Earth’s surface, with all of its
plants, animals, and humans, is bombarded by roughly 100 billion
neutrinos per second coming from the sun.  They pass through us unnoticed, and almost all of
them pass through the entire mass of the Earth, exiting unchanged
on the opposite side.

[large [b Discovery]]

The neutrino was first proposed by Wolfgang Pauli in 1930 to explain
some odd results coming from exeriments with radioactive ...



the continuous spectrum of beta decay.
Let's unpack this statement.

$$
{}^{14}_6\\text{C} \\rightarrow {}^{14}_7\\text{N} + e^- + \\bar{\\nu}

[large [b Links]]

[link Article by Dennis Overbye https://www.nytimes.com/2020/04/15/science/physics-neutrino-antimatter-ichikawa-t2k.html?smid=tw-share]

[link IceCube Neutrino Observatory https://icecube.wisc.edu/]

[link 1968. First experiment to detect electron neutrinos produced by the sun https://icecube.wisc.edu/neutrino-history/1968/01/1968-first-experiment-to-detect-electron-neutrinos-produced-by-the-sun/]

[link 1956. First discovery of the neutrino by an experiment https://icecube.wisc.edu/neutrino-history/1956/01/1956-first-discovery-of-the-neutrino-by-an-experiment/]



[link 1931. Pauli presents hypothetical “neutron” particle https://icecube.wisc.edu/neutrino-history/1931/01/1931-pauli-presents-hypothetical-neutron-particle/]
"""
