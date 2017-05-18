module Update exposing (..)

import Random
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartGame ->
            { model | state = Model.Playing }
                ! [ Random.generate UpdateNumber <| Random.int 1 model.maxNumber ]

        ResetGame ->
            Model.initialModel
                ! []

        UpdateMaxNumber maxNumber ->
            { model | maxNumber = maxNumber }
                ! []

        UpdateNumber number ->
            { model | number = number }
                ! []

        UpdatePlayerGuess playerGuess ->
            { model | playerGuess = playerGuess }
                ! []

        SubmitGuess ->
            let
                newState =
                    case (model.playerGuess == model.number) of
                        True ->
                            Model.Finished

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
    | ResetGame
    | UpdateMaxNumber Int
    | UpdateNumber Int
    | UpdatePlayerGuess Int
    | SubmitGuess
