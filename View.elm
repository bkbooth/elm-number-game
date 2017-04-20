module View exposing (..)

import Html exposing (Html, button, div, form, h1, h3, input, label, p, text)
import Html.Attributes exposing (action, for, id, style, type_, value)
import Html.Events exposing (onClick, onInput)
import Model exposing (..)
import Update exposing (..)


view : Model -> Html Msg
view model =
    let
        currentView =
            case model.state of
                Initial ->
                    initialView model

                Playing ->
                    playingView model

                Finished ->
                    finishView model
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


playingView : Model -> Html Msg
playingView model =
    div []
        [ p [] [ text "I'm thinking of a number between 1 and 10..." ]
        , label [ for "player-guess" ]
            [ text "Are you thinking of: "
            , input
                [ type_ "text"
                , id "player-guess"
                , value (toString model.playerGuess)
                , onInput UpdatePlayerGuess
                ]
                []
            ]
        , button
            [ onClick SubmitGuess ]
            [ text "Submit!" ]
        , guessesView model
        ]


finishView : Model -> Html Msg
finishView model =
    div []
        [ p [] [ text "You guessed correct!" ]
        , p [] [ text ("It took " ++ (toString <| List.length model.guesses) ++ " guesses") ]
        , guessesView model
        , button
            [ onClick StartGame ]
            [ text "Play Again?" ]
        ]


guessesView : Model -> Html Msg
guessesView model =
    div [] <|
        List.map (\guess -> p [] [ text ("You guessed " ++ (toString guess)) ]) model.guesses


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
            , p [] [ text ("State: " ++ (toString model.state)) ]
            , p [] [ text ("Number: " ++ (toString model.number)) ]
            , p [] [ text ("Player Guess: " ++ (toString model.playerGuess)) ]
            , p [] [ text ("Guesses: " ++ (toString model.guesses)) ]
            ]
