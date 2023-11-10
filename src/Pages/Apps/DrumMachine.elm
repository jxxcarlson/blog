module Pages.Apps.DrumMachine exposing (Model, Msg, page)

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
    ( { window = shared.dimensions, routeString = "/apps/drum-machine" }, Effect.none )


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
Drum Machine

[i The [link Drum Machine app https://jxxcarlson.github.io/app/drumlanguage.html] turns text into drum sounds. The app features
two text boxes, Voice 1 and Voice 2.  The first plays in quarter notes,
the second in eighth notes.  Give it a try!]

[i The app  is inspired by the story of John F. Carrington, an English missionary,
who discovered that the people of the Congo were able to use drums to send
detailed messages over long distances.  See [b the Back Story] below.]




[vspace 30]

[image https://global.discourse-cdn.com/standard17/uploads/elm_lang/optimized/2X/9/9b1b0a2734e88c93dc91e5cb711f32cb965d4ef1_2_1096x1000.png  width:fill]

[large [b The Back Story]]

Some time ago, I read James Gleick’s book The Information: a [u History, a Theory, a Flood].
In the first chapter, he recounts a remarkable discovery by John F. Carrington,
an English missionary, who took up residence in the Congo in 1938, working for the
Baptist Missionary Society. On a trip from the Society’s Yakutsu station on the
Upper Congo River through the Bambole Forest, he realized that the local people
were able to use drums to send detailed messages over long distances. Here
is a short extract of a funeral announcement:

| quotation
La nkesa laa mpombolo, tofolange benteke biesala, tolanga bonteke bolokolo
bole nda elinga l’enjale baenga, basaki l’okala bopele pele.
Bojende bosalaki lifeta Bolenge wa kala kala, tekendake tonkilingonda,
 tekendake beningo la nkaka elinga l’enjale. Tolanga bonteke bolokolo
 bole nda elinga l’enjale, la nkesa la mpombolo.

| quotation
In the morning at dawn, we do not want gatherings for work, we want a
meeting of play on the river. Men who live in Bolenge, do not go to
the forest, do not go fishing. We want a meeting of play on the river,
in the morning at dawn.

It took Carrington some time to decipher the secret of the drums. The key
fact was that the local language was a tonal one, with two tones, high and low.
The drummers, using slit drums, would sound the tones of the words to be sent.
Thus alambaka boili, meaning “he watched the riverbank,” was
rendered as H L H H L L L, where H is a high-pitched sound and L is low-pitched.
While much information is lost in this pitch encoding, that which remains, plus the context,
plus the use of many conventional formulae, gives the listener enough
information to reconstruct the original sentence.

[b A Drum App]

Inspired by this story, I decided to make a little app to do something similar.
You can see a screen shot below. There are two windows, Voice 1 and Voice 2. T
he first plays in quarter notes, the second in eighth notes. Text in each window
is translated into notes via an algorithm we describe later. For example, the text
 `,,,Hey jude` is translated as `Rest Rest Rest G3 C3 C3 Rest D4 C3 Bf3 C3`,
 where spaces and commas are mapped to rests. The notes G3 and G4 are
 the note G in different octaves, and Bf is B-flat. Etc.





Note the period of the two voices taken together. In the case of the voices
in the screenshot, the period is 1800 eighth note beats — the least common
multiple of twice the length of voice 1 and the length of voice 2
(For this purpose we count in eighth notes). In this way two short
fragments, one for each voice, can produce music with a long period
— the smallest number of eighth notes before the music repeats.

[b The Algorithm]

Mapping text to sound
My approach for generating sound was to map each letter a–z to a phonetic
class, then map phonetic classes to musical pitches. T
he phonetic class of a, e, i, o, u is VOWEL.
Consonants are divided into various classes, e.g., m, and n are of class NASAL.
 Each class is assigned a pitch, and so we can map any string of characters
 to a sequence of pitch names. For example, Hello is assigned the
 equence G3 G2 C3 C3 G2. Here the numerical part of a pitch name refers
 to its octave, and so G3 is one octave higher than G2. The pitches used
 to represent the pitch classes are G2 C3, E3, F3, G3, Bb3, D
 — a dominant ninth chord. This choice of mapping makes the drumming
 sound relatively harmonious.

[b Postscript]
Gleick writes that Carrington eventually learned to drum, mainly in Kele,
a Bantu language in what is now Eastern Zaire. He recounts this story:

A Lokele villager said of Carrington “He is not really European,
despite the color of his skin. He used to be from our village, one of us.
After he died, the spirits made a mistake and sent him off far away to a
village of whites to enter the body of a little baby who was born of a w
hite woman instead of one of ours. But he belongs to us, he could not
forget where he came from, and so he came back. If he is a bit awkward
on the drums, this is because of the poor education that the whites gave him.”

There is much more in Gleick’s book. It is a really good read.

[b More info]

For more information, see the (open source) code and the README document at
[link Github https://github.com/jxxcarlson/DrumLanguage]

The code for the app itself — user interface, parsing of the input,
translating the input into a form that Tone.js can understand —
is written in [link Elm https://elm-lang.org], a language of pure functions.

The Tone.js library is used for sound generation. Take a look at the
README file in the [link Github repo https://github.com/jxxcarlson/DrumLanguage] for more details.



"""
