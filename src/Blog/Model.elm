module Blog.Model exposing (Model)


type alias Model =
    { window : { width : Int, height : Int }
    , routeString : String
    }
