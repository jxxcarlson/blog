module Pages.Science.Entropy exposing (Model, Msg, page)

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
    ( { window = shared.dimensions, routeString = "/science/entropy" }, Effect.none )


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
Entropy

[vspace 30]
[red Work in Progress]

# Introduction and History

Entropy is often characterzed as a measure of the disorder of a system.  Imagine, for
example, the drawer in which I put my socks. When I first put my socks there,
I laid them out in three rows: hiking socks, every day rows, and dress socks.
In each row I sort them by color: white and black, four of each. Each day I
take out a sock to wear, and every once in a while I do the laundry and
put the clean socks back in the drawer.  But, being lazy and in a hurry,
I just throw them in the drawer.  Eventually, the drawer is a mess: the
socks are all mixed up — they are "at random."

Let's try to quantify the state of the sock drawer.  There are three
rows of socks and in each row there are two boxes, one for the
black socks, one for the white ones.  In each box there are four socks.
Given four socks of a particular color, there are $4! = 24$ ways to
to lay them out in the box.  There are a total of 6 boxes, so there
are $6 \\times 24 = 144$ ways to lay out the socks in the drawer.
In the jargon of statistical mechanics, my nicely organized
sock drawer has 144 microstates.

Now consider the disorganized, "random" drawer.  The 24 socks
are laid out any old way in the six boxes.  There are $24! = 6.204 \\times 10^{24}$
ways to do arrange the socks. This is a [i huge] number! It is almost the
same as Avogadro's number, $6.022 \\times 10^{23}$, which is the number of molecules in
one a mole of a substance. One mole of water takes up 18 cubic centimeters
(1.2 tablespoons).




The number of microstates of a system is denoted by $\\Omega$.  This we have

- $\\Omega_{\\text{tidy sock drawer}} = 144$

- $\\Omega_{\\text{messy sock drawer}} = 6.204 \\times 10^{24}$

The last numbers is so large that we consider instead its logarithm (the natural logarithm), $S \\log \\Omega$.
The entropy of our sock drawer is therefore

- $S_{\\text{tidy sock drawer}} =  \\log 144 \\approx 5$

- $S_{\\text{messy sock drawer}} =  \\log 6.204 \\times 10^{24} \\approx 55$

The entropy of the messy sock drawer is larger than that of the tidy sock drawer by a factor of about 10.




## Properties of the Entropy

Suppose that my two children have sock drawers organized in the same as mine is organized.
Because Larry and Suzie do not consult or cooperate on the organization of their sock drawers,
the microstate of one is independent of the microstate of the other.  Therefore the
total number of microstates of the sock drawers considered jointly is the product of the number of microstates
of the children's individual sock drawers:

$$
\\Omega_{\\text{Larry and Suzie}} = \\Omega_{\\text{Larry}} \\Omega_{\\text{Suzie}}.

The formula for the entropy is even nicer (it is [i additive]):

$$
S_{\\text{Larry and Suzie}} = S_{\\text{Larry}} + S_{\\text{Suzie}}.



If Larry and Suzie are both messy, then $S_{\\text{Larry and Suzie}} = 2S_{\\text{messy sock drawer}} \\approx 110 $.
However, it turns out that Suzie is very organized, so

$$
S_{\\text{Larry and Suzie}} = S_{\\text{messy sock drawer}} + S_{\\text{tidy sock drawer}} \\approx 60.


## Entropy in Physics

The concept of entropy emerged in the mid-19th century with 
the development of the second law of thermodynamics. 

The term "entropy" was first introduced by Rudolf Clausius in 1865. 
Clausius was one of the central figures in the formulation of the s
econd law of thermodynamics.
He formulated the concept of entropy as a mathematical expression 
of the second law, which states that energy spontaneously tends to 
flow only from being concentrated in one place to becoming dispersed and spread out.
Clausius defined entropy in terms of reversible processes and heat transfer,
 giving the differential form

|| equation
\\Delta S = \\frac{\\Delta Q}{T}

where $\\Delta S$ is the change in entropy, $\\Delta Q$ is the incremental heat transfer, and $T$ is the temperature.
all this .... XXX ....

Clausius' work laid the foundation for the interpretation of entropy as a measure of disorder and the unavailability of energy to do work.
Ludwig Boltzmann (1844–1906):

Boltzmann extended the concept of entropy into the statistical realm, connecting
it with the probabilistic behavior of particles in a gas.
He is most famous for the Boltzmann equation and the statistical interpretation
of entropy, which relates the macroscopic property of entropy to the microscopic
behavior of particles. Boltzmann's insight was that entropy could be understood
as a measure of the number of microscopic configurations $\\Omega$
 that correspond to a macroscopic state (defined by macroscopic variables like temperature, volume, and pressure).
The famous Boltzmann's entropy formula, 

|| equation
S = k_B \\log \\Omega

where $k_B$ is the Boltzmann constant, quantitatively links the entropy of a system
to the logarithm of the number of ways the system's particles can be arranged,
consistent with the observed macroscopic state (this is known as the statistical definition of entropy).
Boltzmann's tombstone is inscribed with this formula.
 log(W), signifying its profound importance.


The Boltzmann constant is $k_B = 1.380649 \\times 10^{-23} \\text{Joules/K}$, where $\\text{K}$
is the temperature in Kelvins. The degrees of the Kelvin scale are the same as the degrees of
the Centigrade scale, except for the zero point.  Zero degrees K is $-273.16$ degrees C.
This is the temperature at which all molecular motion ceases (except for quantum fluctuations).


# Probabalistic Interpretation


The [i Shannon entropy] of an  system with $\\Omega$ microstates is defined to be

|| equation
H = - \\sum_{k=1}^\\Omega p_k \\log_2 p_k

where $p_k$ is the probability that the system is in state $k$.

Shannon introduced his entropy function as a measure of the information that can
be transmitted through a communication channel.  Consider a message like `m = 01101001` which consists
of zeros and ones.  If zeroes and ones occurring in each position with  equal probability, then the we
can consider the message to be a microstate of a system of $\\Omega = 2^n$ equally probable microstates, where $n$ is the length
of the message.  The entropy of this system is

|| equation
H = - \\log_2 \\Omega = n,

which is the number of bits in the message.  If the message source is not random, then the entropy is less than $n$.


[b Connection with the Boltzmann Entropy]


Suppose that
the probabilities $p_k$ are all the same, so that $p_k = 1/\\Omega$.  Then

|| equation
H = - \\sum_{k=1}^\\Omega \\frac{1}{\\Omega} \\log_2 \\frac{1}{\\Omega} = \\log_2 \\Omega.

In this case, the Shannon entropy is the logarithm of the number of microstates, up to a multiplicative constant:

|| equation
H = \\log_2 \\Omega = (\\log_2 e) \\log_e \\Omega \\approx  1.44 \\log \\Omega,

where we write $\\log$ for $\\log_e$.  Thus

|| equation
k_B H = (\\log_2 e) S

where $k_B$ is the Boltzmann constant.
Thus the Shannon entropy is the Boltzmann entropy up to a multiplicative constant
and [i vice versa].



# Mathematical Derivation

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
