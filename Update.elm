module Update exposing (..)

import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateNumber number ->
            { model | number = number }
                ! []

        UpdatePlayerGuess playerGuess ->
            { model | playerGuess = playerGuess }
                ! []

        UpdateSubmitted isSubmitted ->
            { model | submitted = isSubmitted }
                ! []

        UpdateCorrect isCorrect ->
            { model | correct = isCorrect }
                ! []


type Msg
    = UpdateNumber Int
    | UpdatePlayerGuess Int
    | UpdateSubmitted Bool
    | UpdateCorrect Bool
