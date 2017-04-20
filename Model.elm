module Model exposing (..)


type alias Model =
    { number : Int
    , playerGuess : Int
    , submitted : Bool
    , correct : Bool
    }
