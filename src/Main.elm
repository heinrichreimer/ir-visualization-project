module Main exposing (main)

import Bootstrap.Grid as Grid
import Bootstrap.Grid.Col as Col
import Bootstrap.Modal as Modal
import Bootstrap.Navbar as Navbar
import Browser
import Browser.Navigation as Navigation
import Components.Navigation exposing (bottomMenu, topMenu)
import Flags exposing (Flags)
import Html exposing (Html, div, text)
import Model exposing (Model, Page(..))
import Msg exposing (Msg)
import Pages exposing (pageContent)
import Url exposing (Url)
import Url.Parser as UrlParser exposing (Parser, s, top)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = Msg.RequestUrl
        , onUrlChange = Msg.ChangeUrl
        }


init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init _ url key =
    let
        ( navState, navCmd ) =
            Navbar.initialState Msg.UpdateNav

        ( model, urlCmd ) =
            urlUpdate url { navKey = key, navState = navState, page = Home, modalVisibility = Modal.hidden }
    in
    ( model, Cmd.batch [ urlCmd, navCmd ] )


subscriptions : Model -> Sub Msg
subscriptions model =
    Navbar.subscriptions model.navState Msg.UpdateNav


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Msg.RequestUrl req ->
            case req of
                Browser.Internal url ->
                    ( model, Navigation.pushUrl model.navKey <| Url.toString url )

                Browser.External href ->
                    ( model, Navigation.load href )

        Msg.ChangeUrl url ->
            urlUpdate url model

        Msg.UpdateNav state ->
            ( { model | navState = state }
            , Cmd.none
            )

        Msg.CloseModal ->
            ( { model | modalVisibility = Modal.hidden }
            , Cmd.none
            )

        Msg.ShowModal ->
            ( { model | modalVisibility = Modal.shown }
            , Cmd.none
            )


urlUpdate : Url -> Model -> ( Model, Cmd Msg )
urlUpdate url model =
    case decode url of
        Nothing ->
            ( { model | page = Home }, Cmd.none )

        Just route ->
            ( { model | page = route }, Cmd.none )


decode : Url -> Maybe Page
decode url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
        |> UrlParser.parse routeParser


routeParser : Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home top
        , UrlParser.map GettingStarted (s "getting-started")
        , UrlParser.map Modules (s "modules")
        ]


view : Model -> Browser.Document Msg
view model =
    { title = "Information Visualization Project"
    , body =
        [ div []
            [ topMenu Msg.UpdateNav model.navState
            , mainContent model
            , bottomMenu Msg.UpdateNav model.navState
            , modal model
            ]
        ]
    }


mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <| pageContent model.page


modal : Model -> Html Msg
modal model =
    Modal.config Msg.CloseModal
        |> Modal.small
        |> Modal.h4 [] [ text "Getting started ?" ]
        |> Modal.body []
            [ Grid.containerFluid []
                [ Grid.row []
                    [ Grid.col
                        [ Col.xs6 ]
                        [ text "Col 1" ]
                    , Grid.col
                        [ Col.xs6 ]
                        [ text "Col 2" ]
                    ]
                ]
            ]
        |> Modal.view model.modalVisibility
