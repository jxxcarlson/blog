module Components.Sidebar exposing (view)

import Element exposing (..)
import Element.Font as Font
import Element.Background as Background
import View exposing (View)
import Color



view :
    { title : String
    , attributes : List (Element msg)
    , element: Element msg 
    }
    -> View msg
view props =
    { title = props.title
    , attributes = []
    , element = row [ centerX] [
       sidebar_
       , props.element
    ]
  }


sidebar_ =
    column [alignTop, Font.size 16, spacing 8
        , paddingXY 24 12,  Background.color Color.sidebar] [
                  link [] { url = "/", label = el [] (text "Home")}
                , link [] { url = "/about", label = el [] (text "About")}
                , link [] { url = "/apps", label = el [] (text "Apps")}
                , link [] { url = "/counter", label = el [] (text "Counter")}
                , link [] { url = "/scripta", label = el [] (text "Scripta")}

        ]