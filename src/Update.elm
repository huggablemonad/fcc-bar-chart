module Update exposing (update)

{-| This module contains functions for updating the `Model`.

@docs update

-}

-- Application specific imports.

import Model exposing (Model)
import Messages exposing (Msg(..))


{-| Update the application state.
-}
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Hover point ->
            ( Model.setHovering point, Cmd.none )
