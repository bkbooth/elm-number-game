module View exposing (..)

import Html exposing (Html, button, div, h1, h3, p, text)
import Html.Attributes exposing (id, style)
import Html.Events exposing (onClick)
import Model exposing (Model)
import Update exposing (..)


view : Model -> Html Msg
view model =
    let
        currentView =
            case model.started of
                True ->
                    gameView model

                False ->
                    initialView model
    in
        div [ id "app-root" ]
            [ h1 [] [ text "Number Game" ]
            , currentView
            , debugView model
            ]


initialView : Model -> Html Msg
initialView model =
    p []
        [ button
            [ onClick StartGame ]
            [ text "Start Game" ]
        ]


gameView : Model -> Html Msg
gameView model =
    p []
        [ text "I'm thinking of a number between 1 and 10..." ]


debugView : Model -> Html Msg
debugView model =
    let
        styles =
            style
                [ ( "background-color", "LightCoral" )
                , ( "margin-top", "100px" )
                ]
    in
        div [ styles ]
            [ h3 [] [ text "Debug..." ]
            , p [] [ text ("Number: " ++ (toString model.number)) ]
            , p [] [ text ("Player Guess: " ++ (toString model.playerGuess)) ]
            , p [] [ text ("Started? " ++ (toString model.started)) ]
            , p [] [ text ("Submitted? " ++ (toString model.submitted)) ]
            , p [] [ text ("Correct? " ++ (toString model.correct)) ]
            ]
