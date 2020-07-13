module Pages exposing (pageContent)

import Html exposing (Html)
import Model exposing (Page(..))
import Msg exposing (Msg)
import Pages.GettingStarted as GettingStarted
import Pages.Home as Home
import Pages.Modules as Modules


pageContent : Page -> List (Html Msg)
pageContent page =
    case page of
        Home ->
            Home.page

        GettingStarted ->
            GettingStarted.page

        Modules ->
            Modules.page
