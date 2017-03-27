module Subscriptions exposing (subscriptions)

{-| This module contains functions to subscribe to events needed by the
application.

@docs subscriptions

-}

-- Application specific imports.

import Model exposing (Model)
import Messages exposing (Msg(..))


{-| Event sources that the application subscribes to.
-}
subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
