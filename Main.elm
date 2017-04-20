module Main exposing (main)

import Html
import Model exposing (Model)
import Update exposing (Msg)
import View


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = Update.update
        , view = View.view
        , subscriptions = subscriptions
        }


init : ( Model, Cmd Msg )
init =
    Model 0 0 False False False
        ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
