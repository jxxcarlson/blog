module Evergreen.V31.Main exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V31.Main.Layouts.Model
import Evergreen.V31.Main.Layouts.Msg
import Evergreen.V31.Main.Pages.Model
import Evergreen.V31.Main.Pages.Msg
import Evergreen.V31.Shared
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , page : Evergreen.V31.Main.Pages.Model.Model
    , layout : Maybe Evergreen.V31.Main.Layouts.Model.Model
    , shared : Evergreen.V31.Shared.Model
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | Page Evergreen.V31.Main.Pages.Msg.Msg
    | Layout Evergreen.V31.Main.Layouts.Msg.Msg
    | Shared Evergreen.V31.Shared.Msg
    | Batch (List Msg)
