module Style exposing (button)

import Element exposing(..)
import Element.Input as Input
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Color

button w h attr = [Background.color Color.buttonBG, width w, height h, Font.color Color.buttonFG] ++ attr