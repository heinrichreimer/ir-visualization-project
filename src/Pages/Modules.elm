module Pages.Modules exposing (page)

import Bootstrap.ListGroup as ListGroup
import Html exposing (Html, h1, text)
import Msg exposing (Msg)


page : List (Html Msg)
page =
    [ h1 [] [ text "Modules" ]
    , ListGroup.ul
        [ ListGroup.li [] [ text "Alert" ]
        , ListGroup.li [] [ text "Badge" ]
        , ListGroup.li [] [ text "Card" ]
        ]
    ]
