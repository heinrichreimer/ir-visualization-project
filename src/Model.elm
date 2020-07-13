module Model exposing (Model, Page(..))

import Bootstrap.Modal as Modal
import Bootstrap.Navbar as Navbar
import Browser.Navigation as Navigation


type alias Model =
    { page : Page
    , navKey : Navigation.Key
    , navState : Navbar.State
    , modalVisibility : Modal.Visibility
    }


type Page
    = Home
    | GettingStarted
    | Modules
