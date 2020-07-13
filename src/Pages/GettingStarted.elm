module Pages.GettingStarted exposing (page)

import Bootstrap.Button as Button
import Html exposing (Html, h2, text)
import Html.Events as Events
import Msg exposing (Msg)


page : List (Html Msg)
page =
    [ h2 [] [ text "Getting started" ]
    , Button.button
        [ Button.success
        , Button.large
        , Button.block
        , Button.attrs [ Events.onClick Msg.ShowModal ]
        ]
        [ text "Click me" ]
    ]
