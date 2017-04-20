module Model exposing (..)


type alias Model =
    { state : GameState
    , number : Int
    , playerGuess : Int
    , guesses : List Int
    }


type GameState
    = Initial
    | Playing
    | Finished
