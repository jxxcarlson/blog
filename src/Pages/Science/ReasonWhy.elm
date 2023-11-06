module Pages.Science.ReasonWhy exposing (Model, Msg(..), page)

import Components.Sidebar as Sidebar
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
    let
        _ =
            Debug.log "@@@!SH: @Page New" shared.dimensions
    in
    Page.new
        { init = init shared route
        , update = update
        , view = view shared.dimensions
        , subscriptions = subscriptions
        }



-- INIT


type alias Model =
    { window : { width : Int, height : Int }
    , routeString : String
    }


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions |> Debug.log "@@@!SH: INIT MODEL", routeString = "/science/reason-why" }, Effect.none )


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


view : { width : Int, height : Int } -> Model -> View Msg
view window model =
    Sidebar.view window
        { title = "Jim's Blog"
        , attributes = []
        , element = Scripta.element window content |> Element.map Render
        , currentRoute = model.routeString
        }


content =
    """
| title
The Reason Why

[image https://jxxcarlsonblog.files.wordpress.com/2020/04/merlin_171584709_5ddc217b-264c-41ac-8bca-8e1b90794d4c-superjumbo.jpg width:fill]

In the beginning, at the instant of creation, there came into being numerous particles:
quarks and antiquarks, protons and and antiprotons, electrons and antielectrons,
each kind paired with its opposite. Thus was matter and antimatter created in equal measure.
But when particle met antiparticle, an exceedingly frequent occurrence in those early times,
the encounter was brief, violent, and almost always fatal, as both were destroyed, their substance
vanishing in a flash of  pure energy. When the great annihilation came to an end, there were
few survivors of this many-fold decimation: no more than one in a billion remained.
They were all of one kind, the kind we now call matter.  It is of these particles that
all we see about us is made, from the grains of sand on the seashore to the trees to the sun,
the stars, and to the most distant galaxies.  The clue for our improbable and miraculous existence
is hidden in the image above, an image of muon neutrino traces in a bubble chamber,
the paradoxically huge microscope that physicists use to probe the smallest realms.
In the laws that govern us, it turns out, there is a small asymmetry,
a kind of distinction between right and left, charge and anticharge,
which are otherwise equal mirror images of one another.
Neutrinos, born of the annihilation of particle and antiparticle, of
the explosions of stars which create the iron and nickel of which our earth’s core is made,
of the proton-proton reactions which power our sun,  carry to us the message of this tiny
discrepancy, the reason for our existence.

(Draft #1)

[link Article by Dennis Overbye https://www.nytimes.com/2020/04/15/science/physics-neutrino-antimatter-ichikawa-t2k.html?smid=tw-share], New York Times

[link Physics note https://www.sns.ias.edu/~jnb/Papers/Popular/Scientificamerican69/scientificamerican69.html]: Neutrinos are ghostly particles that interact very weakly with matter.
The proton-proton reactions that power the sun send out a huge stream of neutrinos.
Each square centimeter of the Earth’s surface is bombarded by roughly 100 billion
neutrinos per second.  Almost all of them pass through the Earth, exiting unchanged
on the opposite side.
"""
