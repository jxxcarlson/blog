module Evergreen.V41.Main exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V41.Main.Layouts.Model
import Evergreen.V41.Main.Layouts.Msg
import Evergreen.V41.Main.Pages.Model
import Evergreen.V41.Main.Pages.Msg
import Evergreen.V41.Shared
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , page : Evergreen.V41.Main.Pages.Model.Model
    , layout : Maybe Evergreen.V41.Main.Layouts.Model.Model
    , shared : Evergreen.V41.Shared.Model
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | Page Evergreen.V41.Main.Pages.Msg.Msg
    | Layout Evergreen.V41.Main.Layouts.Msg.Msg
    | Shared Evergreen.V41.Shared.Msg
    | Batch (List Msg)
