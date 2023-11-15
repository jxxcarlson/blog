module Evergreen.V44.Main exposing (..)

import Browser
import Browser.Navigation
import Evergreen.V44.Main.Layouts.Model
import Evergreen.V44.Main.Layouts.Msg
import Evergreen.V44.Main.Pages.Model
import Evergreen.V44.Main.Pages.Msg
import Evergreen.V44.Shared
import Url


type alias Model =
    { key : Browser.Navigation.Key
    , url : Url.Url
    , page : Evergreen.V44.Main.Pages.Model.Model
    , layout : Maybe Evergreen.V44.Main.Layouts.Model.Model
    , shared : Evergreen.V44.Shared.Model
    }


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | Page Evergreen.V44.Main.Pages.Msg.Msg
    | Layout Evergreen.V44.Main.Layouts.Msg.Msg
    | Shared Evergreen.V44.Shared.Msg
    | Batch (List Msg)
