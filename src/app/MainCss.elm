module MainCss exposing (..)

import Css
import Css.Elements


css =
    Css.stylesheet
        [ Css.Elements.body
            [ Css.backgroundColor "black"
            , Css.color "white"
            ]
        ]
