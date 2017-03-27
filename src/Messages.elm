module Messages exposing (Msg(..))

{-| This module contains messages handled by the application.

@docs Msg

-}

-- 3rd party imports.

import Plot


{-| Messages handled by the application.
-}
type Msg
    = Hover (Maybe Plot.Point)
