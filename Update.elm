module Update exposing (..)

import Random
import Model exposing (..)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartGame ->
            Model Playing 0 0 []
                ! [ Random.generate UpdateNumber <| Random.int 1 10
                  ]

        UpdateNumber number ->
            { model | number = number }
                ! []

        UpdatePlayerGuess playerGuessString ->
            let
                playerGuess =
                    case (String.toInt playerGuessString) of
                        Ok value ->
                            value

                        Err _ ->
                            0
            in
                { model | playerGuess = playerGuess }
                    ! []

        SubmitGuess ->
            let
                newState =
                    case (model.playerGuess == model.number) of
                        True ->
                            Finished

                        False ->
                            model.state
            in
                { model
                    | guesses = model.playerGuess :: model.guesses
                    , state = newState
                }
                    ! []


type Msg
    = StartGame
    | UpdateNumber Int
    | UpdatePlayerGuess String
    | SubmitGuess
