module Update exposing (..)

import Random
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        StartGame ->
            Model 0 0 True False False
                ! [ Random.generate UpdateNumber <| Random.int 1 10
                  ]

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
    = StartGame
    | UpdateNumber Int
    | UpdatePlayerGuess Int
    | UpdateSubmitted Bool
    | UpdateCorrect Bool
