module Color exposing (applet, sidebar, buttonBG , buttonFG)

import Element exposing(..)

applet = rgb 0.9 0.9 1.0
sidebar = rgb 0.9 0.9 1.0 
buttonBG = rgb 0.2 0.2 0.4
buttonFG = gray 0.9

gray c = rgb c c c