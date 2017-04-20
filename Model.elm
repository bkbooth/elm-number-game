module Model exposing (..)


type alias Model =
    { number : Int
    , playerGuess : Int
    , started : Bool
    , submitted : Bool
    , correct : Bool
    }
