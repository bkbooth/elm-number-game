module Model exposing (..)


type alias Model =
    { state : GameState
    , number : Int
    , maxNumber : Int
    , playerGuess : Int
    , guesses : List Int
    }


initialModel : Model
initialModel =
    Model Initial 0 10 0 []


type GameState
    = Initial
    | Playing
    | Finished
