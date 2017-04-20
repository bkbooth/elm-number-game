module Main exposing (main)

import Html
import Model exposing (..)
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
    Model Initial 0 0 []
        ! []


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
