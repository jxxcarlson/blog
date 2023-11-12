module Pages.Science exposing (Model, Msg, page)

import Blog.Model
import Blog.Msg
import Blog.ScriptaScience as Scripta
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
    ( { window = shared.dimensions, routeString = "/science" }, Effect.none )


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
Science

[i To your left: essays on science: some playful, some poetic, many serious.]

[vspace 20]
[b About the essays ...  ]


Science is one of the great achievements of the human mind,
an achievement that is as much a part of our culture
as the music of the great composers and improvisers,
the work of the great writers and painters, and the architects who
have raised up cathedrals, temples, mosques, and skyscrapers.

The aim of this blog is to present some of this common cultural
heritage in a form that conveys the intricacies of the path
to discovery. It is rarely a straight line. The motive
force for those who follow the path is curiosity, and
the guide is an idea, or perhaps just a guess or a hunch.

Science is first of all a way of thinking, a way of
of finding out about the world, and of trying
to make sure that what find is reliable knowledge. We often think
about science as a body of answers, a collection of facts
to be memorized  But before there
can be answers, there most be questions.  And for
the answers to be valuable, the questions must be good ones.
What
is the world made of? What are the stars? Are the stars made of the same stuff
as we are? How far away are they? What is the nature of light?
Is it a particle or a wave?  How fast does it moves?
How did life begin? What is a virus?  It is alive?
Why do viruses exist? And so on ...


Consider the
first question, [i what is the world made of?].
For this one we know the answer: everything we can see
around us is made [i atoms]: the
Earth itself, the fish of the sea,
the flowers in the garden, the trees in the forest — as
well as the sun, the stars of our galaxies, and also
of the most distant and ancient galaxies — all are
made of atoms, particles so small that even the
most powerful microscope cannot see them.

That the world is made of atoms is now common knowledge.
But [i how] is it that we know this? How did we suspect
that the world is made of tiny particles that we cannot see?
How did we find out that this is so? Can we be sure
that we are right?  To be sure about something we
cannot see is a tall order.

There are also unanswered questions, which we
will also discuss.  Consider, for example,
the case of [i dark matter].  This  is another form of
matter which we cannot see —
not with our own eyes, or with a microscope or a telescope.
This may sound like science fiction or magic, but
we know it is there
because we can "see" its effects: galaxies rotate faster
than can be explained by the gravitational pull of the
matter we do see: stars and planets, clouds of gas and dust.
We even know how much dark matter there is in the universe:
roughly ten times more than the matter in atoms.
But what is this unseen matter? We do not yet know, despite years of
effort by many scientists.




"""



--These are the questions to be explored in this blog.
--
--|| hide
--[i Below: some links outside this blog.]
--- [link Feynman on Physics and Chess https://scripta.io/s/jxxcarlson:feynman-physics-chess]
--- [link What is the World Made Of? https://scripta.io/s/jxxcarlson:what-is-the-world-made-of]
--
--|| hide
--Does the  have a beginning?  Does it have an end?
--
--
--|| hide
--conveys the human drama
--of discovery, the beauty of the ideas, their explanatory
--power, and the
--
--[b The Plan]
--
--The articles in this science blog follow a simple plan:
--
--. State a question
--
--. Describe the answer in a way that is accessible to the general reader
--
--. Explain [i how] we came to know that the answer and how we know that it is correct.
--
--. Give more details for the reader who wants to know more.
