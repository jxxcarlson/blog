module Pages.Science.Neutrino exposing (Model, Msg, page)

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
    ( { window = shared.dimensions, routeString = "/science/neutrino" }, Effect.none )


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


content =
    """
| title
The Neutrino: a Parable

Let's begin our story by thinking about matter: the stuff of which
everything from grains of sand to stars, from bacteria to humans to
trees is made.  After much intellectual struggle that
began with the Greek philosophers Leucippus and Democritus
(fifth centery BC), we have come
to know that matter is made of atoms are made of tiny particles
called atoms.  Tiny means very, very tiny — so small that we cannot
see them with even the most powerful microscope.  But atoms themselves
are made of even smaller things: electrons, protons, and neutrons.
The protons and neutrons live in the center of the atom, a place
called the nucleus.  The electrons live in a cloud around the nucleus.
They are protons and neutrons are heavy, but the electrons are very light —
about $2,000$ times lighter than the protons and neutrons.
All these particles carry a certain amount of electric charge: $+1$ unit for the
proton, $0$ units for the neutron, and $-1$ unit for the electron.


[image https://www.pathwayz.org/Node/Image/url/aHR0cHM6Ly9pLmltZ3VyLmNvbS90Y0lqVkFzLnBuZz8x]



, and that atoms are made of


The neutrino, like the electron, the proton, and the neutron, is one of the
fundamental particles of the universe.




It is a lepton, a particle that does not
interact with the strong nuclear force. It is also a fermion, a particle that
obeys the Pauli exclusion principle. The neutrino is the only fermion that does
not interact with the electromagnetic force. It is also the only fermion that
does not have an electric charge. The neutrino is the only fermion that does not
interact with the strong nuclear force. It is also the only fermion that does
not have an electric charge.




$$
{}^{14}_6\\text{C} \\rightarrow {}^{14}_7\\text{N} + e^- + \\bar{\\nu}

[large [b Links]]


Story: atoms

[link Article by Dennis Overbye https://www.nytimes.com/2020/04/15/science/physics-neutrino-antimatter-ichikawa-t2k.html?smid=tw-share]

[link IceCube Neutrino Observatory https://icecube.wisc.edu/]

[link 1968. First experiment to detect electron neutrinos produced by the sun https://icecube.wisc.edu/neutrino-history/1968/01/1968-first-experiment-to-detect-electron-neutrinos-produced-by-the-sun/]

[link 1956. First discovery of the neutrino by an experiment https://icecube.wisc.edu/neutrino-history/1956/01/1956-first-discovery-of-the-neutrino-by-an-experiment/]



[link 1931. Pauli presents hypothetical “neutron” particle https://icecube.wisc.edu/neutrino-history/1931/01/1931-pauli-presents-hypothetical-neutron-particle/]
"""
