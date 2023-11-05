module Pages.Math.Entropy exposing (Model, Msg, page)

import Components.Sidebar
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
    Page.new
        { init = init shared route
        , update = update
        , view = view
        , subscriptions = subscriptions
        }



-- MODEL & MSG


type alias Model =
    { window : { width : Int, height : Int }
    , routeString : String
    }


type Msg
    = Render MarkupMsg



-- INIT


init : Shared.Model -> Route () -> () -> ( Model, Effect Msg )
init shared route _ =
    ( { window = shared.dimensions, routeString = "/math/entropy" }, Effect.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- UPDATE


update : Msg -> Model -> ( Model, Effect Msg )
update msg model =
    case msg of
        Render _ ->
            ( model, Effect.none )



-- VIEW


view : Model -> View Msg
view model =
    Components.Sidebar.view model.window
        { title = "Jim's Blog"
        , attributes = []
        , element =
            row [ centerX ]
                [ Scripta.katexCSS
                , Scripta.display model.window src |> Element.map Render
                ]
        , currentRoute = model.routeString
        }


src =
    """
| title
Entropy



The entropy of a system that has $n$ states, each of which occurs with probability $p_k$ is defined to be

|| equation
\\label{eq:entropy}
S(p_1, p_2, \\ldots p_n) = - \\sum_{k=1}^n p_k \\log p_k


If the probabilities are equal, then $S = \\log n$.  This is the maximum entropy, where the maximum is taken over all probability distributiions $(p_1, \\ldots , p_k)$.  On the other hand, if $p_k  = 1$ and all the other probabilities are zero, then $S = 0$.  Thus $S$ has the right qualitative properties: it is small for a highly ordered system in which only one state occurs, and it is large for a highly disorded system in which all states occur with equal probability.

Shannon gave an argument which shows that [eqref eq:entropy] is the
only formula, up to multiplicative constant, that satisfies certain simple properties:


. $S(p_1, \\ldots p_n)$  is continuous.

. $S(1/n, \\ldots 1/n) $ is maximal for all $S(p_1, \\ldots p_n)$ .

.  $S$ is additive in the sense that
$S(AB) = S(A) + \\sum p_kS(B|A)$.


The additivity condition can be motivated as follows. One has a set of $m$ buckets where the $k$-th bucket contains $n_k$ objects.  Experiment $A$ is to select a bucket at random.  The $k$-th bucket is selected with probability $p_k$.  Experiment $B$ is to select an object from the $k$-th bucket. The entropy ("uncertainty") of the experiment is $S(AB)$.  The entropy of the first step is $S(A)$.  The expected value of the entropy of the second step is $p_1S(B|A) + \\cdots p_mS(B|A)$.

Shannnon proceeds as follows.  Let $f(N) = S(1/N, \\ldots 1/N)$.  Suppose that bucket $k$ is selected with probability $p_k = n_k/N$.  Then the additivity relation reads

|| equation
f(N) = S(p_1, \\ldots, p_m) + \\sum_{k=1}^m p_k f(n_k)



Now suppose that the buckets contain equal numbers of objects, so that $n_k = n$, where $N = mn$.  Since $p_k = n_k/N = 1/m$, we have

|| equation
f(N) = S(1/m, \\ldots, 1/m) + \\sum_{k=1}^m \\frac{1}{m} f(n),

or simply


|| equation
f(mn) = f(m) + f(n).



The only continuous solution to this functional equation is $f(m) = K\\log m$
for some constant $K$.  Thus we have

|| equation
K \\log n  = S(p_1, \\ldots, p_m) + \\sum p_k K \\log n_k


so that

|| aligned
  S(p_1, \\ldots, p_m)            & = K(\\log N - \\sum p_k K \\log n_k) \\\\
             & = K(\\sum p_k \\log N - \\sum p_k K \\log n_k) \\\\
             & = K \\sum p_k \\log \\frac{N}{n_k} \\\\
             & = - K \\sum p_k \\log p_k


[b [large References]]

[link Introduction to Statistical Mechanics, Stanford Univerisity, Handout for chapter 7 http://micro.stanford.edu/~caiwei/me334/Chap7_Entropy_v04.pdf]

[link Shannon Entropy, Information Gain, and Picking Balls from Buckets https://medium.com/udacity/shannon-entropy-information-gain-and-picking-balls-from-buckets-5810d35d54b4]
"""
