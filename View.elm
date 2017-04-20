module View exposing (..)

import Html exposing (Html, div, h1, p, text)
import Html.Attributes exposing (id)
import Model exposing (Model)
import Update exposing (Msg)


view : Model -> Html Msg
view model =
    div [ id "app-root" ]
        [ h1 [] [ text "Number Game" ]
        , p [] [ text ("Number: " ++ (toString model.number)) ]
        , p [] [ text ("Player Guess: " ++ (toString model.playerGuess)) ]
        , p [] [ text ("Submitted? " ++ (toString model.submitted)) ]
        , p [] [ text ("Correct? " ++ (toString model.correct)) ]
        ]
