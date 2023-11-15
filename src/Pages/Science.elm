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


Science is one of the great activities and achievements of the human mind,
one that is as much a part of our culture
as the music of the great composers and improvisers,
the work of the great writers and painters, and the architects who
have raised up cathedrals, temples, mosques, and skyscrapers.

The aim of the science section of this blog is to present
a view of science that conveys the intricacies of the path
to discovery, the path from question to idea to confirmed
result. The path is seldom a straight line nor is it short,
and the motive force for those who follow it seeking truth
is what every young child posesses: curiosity..


[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/61127cfc-b1de-433c-e8ba-e20b2f9c0300/public width:100]

Science is first of all a way of thinking, a way of
of finding out about the world, and a way of weeding
out incorrect conclusions and results. We often view
science as a body of answers, a collection of facts
to be memorized  But before there
can be answers, there must be questions.  And for
the answers to be worthwhile, the questions must be good ones.
What
is the world made of? What are the stars? Are the stars made of the same stuff
as we are? How far away are they? What is the nature of light?
Is it a particle or a wave?  How fast does it moves?
How did life begin? What is a virus?  It is alive?
Why do viruses exist? And so on ...


Consider the
first question, [i what is the world made of?]
For this one we know the answer: everything we can see
around us is made [i atoms]: the
Earth itself, the fish of the sea,
the flowers in the garden, the trees in the forest — as
well as the sun, the stars of our galaxy, and even
the most distant and ancient galaxies — all are
made of atoms, particles so small that the
most powerful microscope cannot see them.

That the world is made of atoms is now common knowledge.
But [i how] is it that we know this? How did we suspect
that the world is made of tiny particles that we cannot see?
How did we find out that this is so? Can we be sure
that we are right?  (See [i The Idea of Atom, parts I and II]
for a discussion of these questions.)



There are also unanswered questions.  Consider, for example,
the case of [i dark matter].  This  is a kind of
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


[image https://imagedelivery.net/9U-0Y4sEzXlO6BXzTnQnYQ/61127cfc-b1de-433c-e8ba-e20b2f9c0300/public width:100]

[i I had two goals in writing these essays. The first was to bring greater
public understanding to the intricate, often circuitous path from
question to idea to discovery, with a special emphasis on two quite
different things: the role and interaction of ideas on the one hand
and of experiment and technology on the other.]

[i The second was to give more detail than is usual in popular science
articles and books, of which there are many, and many which are excellent.
For that reason I have tried to write in such a way that the
first part of each article is accessible a very wide audience,
while the second part is for those who want go to farther.]

"""



--
--As we see in [i The Idea of Atom, parts I and II], the idea of atom
--is an old one, going back to the the Greek philosophers
--Leucippus and Democritus in the fifth century B.C.
--It took well over two millennia for the idea to become
--what we would call today a [i scientific theory]. There
--was the work of the Chemist John Dalton in the early
--19th century, and then the work of Albert Einstein
--and the physicist Jean Perrin in the early 20th century.
----
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
