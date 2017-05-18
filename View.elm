module View exposing (..)

import Html exposing (Html)
import Html.Attributes
import Html.Events
import Model exposing (Model)
import Update exposing (Msg(..))


view : Model -> Html Msg
view model =
    let
        currentView =
            case model.state of
                Model.Initial ->
                    initialView model

                Model.Playing ->
                    playingView model

                Model.Finished ->
                    finishView model
    in
        Html.div [ Html.Attributes.id "app-root" ]
            [ Html.h1 [] [ Html.text "Number Game" ]
            , currentView
            ]


initialView : Model -> Html Msg
initialView model =
    Html.div []
        [ Html.p []
            [ Html.text ("I'm going to think of a number between 1 and " ++ (toString model.maxNumber) ++ "...")
            , Html.br [] []
            , Html.text "(Drag the slider to adjust)"
            ]
        , Html.p []
            [ Html.input
                [ Html.Attributes.type_ "range"
                , Html.Events.onInput (UpdateMaxNumber << Result.withDefault 0 << String.toInt)
                , Html.Attributes.value (toString model.maxNumber)
                , Html.Attributes.min "10"
                , Html.Attributes.max "1000"
                , Html.Attributes.step "10"
                ]
                []
            ]
        , Html.p []
            [ Html.button
                [ Html.Events.onClick StartGame ]
                [ Html.text "Start Game" ]
            ]
        ]


playingView : Model -> Html Msg
playingView model =
    Html.div []
        [ Html.p [] [ Html.text ("I'm thinking of a number between 1 and " ++ (toString model.maxNumber) ++ "...") ]
        , Html.label [ Html.Attributes.for "player-guess" ]
            [ Html.text "Are you thinking of: "
            , Html.input
                [ Html.Attributes.type_ "text"
                , Html.Attributes.id "player-guess"
                , Html.Attributes.value (toString model.playerGuess)
                , Html.Events.onInput (UpdatePlayerGuess << Result.withDefault 0 << String.toInt)
                ]
                []
            ]
        , Html.button
            [ Html.Events.onClick SubmitGuess ]
            [ Html.text "Submit!" ]
        , guessesView model
        ]


finishView : Model -> Html Msg
finishView model =
    Html.div []
        [ Html.p [] [ Html.text "You guessed correct!" ]
        , Html.p [] [ Html.text ("It took " ++ (toString <| List.length model.guesses) ++ " guesses") ]
        , guessesView model
        , Html.button
            [ Html.Events.onClick ResetGame ]
            [ Html.text "Play Again?" ]
        ]


guessesView : Model -> Html Msg
guessesView model =
    Html.div [] <|
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
        Html.p [] [ Html.text ("You guessed " ++ (toString guess) ++ " which was " ++ differenceText) ]
