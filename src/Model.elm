module Model exposing (Model, init, getHovering, setHovering)

{-| This module contains the application's [`Model`](#Model).

# Elm Architecture
@docs Model, init

# API
@docs getHovering, setHovering

-}

-- 3rd party imports.

import Plot


{-| Application state.
-}
type Model
    = Model { hovering : Maybe Plot.Point }


{-| Initialize the [`Model`](#Model).
-}
init : Model
init =
    Model { hovering = Nothing }


{-| Return the data point where the mouse is hovering over.
-}
getHovering : Model -> Maybe Plot.Point
getHovering (Model model) =
    model.hovering


{-| Update the data point where the mouse is hovering over.
-}
setHovering : Maybe Plot.Point -> Model
setHovering point =
    Model { hovering = point }
