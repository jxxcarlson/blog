module Evergreen.V33.Main exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V33.Main.Layouts.Model
import Evergreen.V33.Main.Layouts.Msg
import Evergreen.V33.Main.Pages.Model
import Evergreen.V33.Main.Pages.Msg
import Evergreen.V33.Shared
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , page : Evergreen.V33.Main.Pages.Model.Model
    , layout : Maybe Evergreen.V33.Main.Layouts.Model.Model
    , shared : Evergreen.V33.Shared.Model
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | Page Evergreen.V33.Main.Pages.Msg.Msg
    | Layout Evergreen.V33.Main.Layouts.Msg.Msg
    | Shared Evergreen.V33.Shared.Msg
    | Batch (List Msg)
