module Msg exposing (Msg(..))

import Bootstrap.Navbar as Navbar
import Browser exposing (UrlRequest)
import Url exposing (Url)


type Msg
    = ChangeUrl Url
    | RequestUrl UrlRequest
    | UpdateNav Navbar.State
    | CloseModal
    | ShowModal
