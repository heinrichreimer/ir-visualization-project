module Components.Navigation exposing (bottomMenu, topMenu)

import Bootstrap.Navbar exposing (State, brand, config, customItems, itemLink, items, primary, textItem, view, withAnimation)
import Html exposing (Html, a, text)
import Html.Attributes exposing (href)


topMenu : (State -> msg) -> State -> Html msg
topMenu msg state =
    config msg
        |> withAnimation
        |> primary
        |> brand [ href "#" ] [ text "Information Visualization Project" ]
        |> items
            [ itemLink [ href "#getting-started" ] [ text "Getting started" ]
            , itemLink [ href "#modules" ] [ text "Modules" ]
            ]
        |> view state


bottomMenu : (State -> msg) -> State -> Html msg
bottomMenu msg state =
    config msg
        |> withAnimation
        |> items
            [ itemLink [] [ text "© 2020 Jan Heinrich Reimer" ]
            ]
        |> customItems
            [ textItem [] [ a [ href "https://heinrichreimer.eu/imprint/" ] [ text "Imprint" ] ]
            , textItem [] [ text "\u{00A0}" ]
            , textItem [] [ a [ href "https://heinrichreimer.eu/privacy/" ] [ text "Privacy" ] ]
            ]
        |> view state
