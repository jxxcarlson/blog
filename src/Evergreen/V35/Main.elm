module Evergreen.V35.Main exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V35.Main.Layouts.Model
import Evergreen.V35.Main.Layouts.Msg
import Evergreen.V35.Main.Pages.Model
import Evergreen.V35.Main.Pages.Msg
import Evergreen.V35.Shared
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , page : Evergreen.V35.Main.Pages.Model.Model
    , layout : Maybe Evergreen.V35.Main.Layouts.Model.Model
    , shared : Evergreen.V35.Shared.Model
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | Page Evergreen.V35.Main.Pages.Msg.Msg
    | Layout Evergreen.V35.Main.Layouts.Msg.Msg
    | Shared Evergreen.V35.Shared.Msg
    | Batch (List Msg)
