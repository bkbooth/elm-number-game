module View exposing (..)

import Html exposing (Html, button, div, form, h1, h3, input, label, p, text)
import Html.Attributes exposing (action, for, id, max, min, style, type_, value)
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
            ]


initialView : Model -> Html Msg
initialView model =
    div []
        [ p []
            [ text ("I'm going to think of a number between 1 and " ++ (toString model.maxNumber) ++ "...")
            , Html.br [] []
            , text "(Drag the slider to adjust)"
            ]
        , p []
            [ input
                [ type_ "range"
                , onInput (UpdateMaxNumber << Result.withDefault 0 << String.toInt)
                , value (toString model.maxNumber)
                , Html.Attributes.min "10"
                , Html.Attributes.max "1000"
                , Html.Attributes.step "10"
                ]
                []
            ]
        , p []
            [ button
                [ onClick StartGame ]
                [ text "Start Game" ]
            ]
        ]


playingView : Model -> Html Msg
playingView model =
    div []
        [ p [] [ text ("I'm thinking of a number between 1 and " ++ (toString model.maxNumber) ++ "...") ]
        , label [ for "player-guess" ]
            [ text "Are you thinking of: "
            , input
                [ type_ "text"
                , id "player-guess"
                , value (toString model.playerGuess)
                , onInput (UpdatePlayerGuess << Result.withDefault 0 << String.toInt)
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
            [ onClick ResetGame ]
            [ text "Play Again?" ]
        ]


guessesView : Model -> Html Msg
guessesView model =
    div [] <|
        List.map (\guess -> guessView model guess) model.guesses


guessView : Model -> Int -> Html Msg
guessView model guess =
    let
        differenceText =
            if (guess < model.number) then
                "too low"
            else if (guess > model.number) then
                "too high"
            else
                "correct"
    in
        p [] [ text ("You guessed " ++ (toString guess) ++ " which was " ++ differenceText) ]
