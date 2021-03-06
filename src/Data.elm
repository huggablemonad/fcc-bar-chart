module Data exposing (get)

{-| Data for the bar chart.

@docs get

-}


{-| Company-initiated recalls by state in 2016.
-}
get : List ( String, List Float )
get =
    [ ( "AK", [ 0 ] )
    , ( "AL", [ 2 ] )
    , ( "AR", [ 0 ] )
    , ( "AZ", [ 3 ] )
    , ( "CA", [ 271 ] )
    , ( "CO", [ 46 ] )
    , ( "CT", [ 3 ] )
    , ( "DE", [ 1 ] )
    , ( "FL", [ 26 ] )
    , ( "GA", [ 2 ] )
    , ( "HI", [ 14 ] )
    , ( "IA", [ 25 ] )
    , ( "ID", [ 2 ] )
    , ( "IL", [ 119 ] )
    , ( "IN", [ 2 ] )
    , ( "KS", [ 18 ] )
    , ( "KY", [ 4 ] )
    , ( "LA", [ 0 ] )
    , ( "MA", [ 15 ] )
    , ( "MD", [ 7 ] )
    , ( "ME", [ 0 ] )
    , ( "MI", [ 55 ] )
    , ( "MN", [ 53 ] )
    , ( "MO", [ 2 ] )
    , ( "MS", [ 25 ] )
    , ( "MT", [ 0 ] )
    , ( "NC", [ 28 ] )
    , ( "ND", [ 2 ] )
    , ( "NE", [ 5 ] )
    , ( "NH", [ 0 ] )
    , ( "NJ", [ 52 ] )
    , ( "NM", [ 2 ] )
    , ( "NV", [ 1 ] )
    , ( "NY", [ 169 ] )
    , ( "OH", [ 52 ] )
    , ( "OK", [ 3 ] )
    , ( "OR", [ 24 ] )
    , ( "PA", [ 32 ] )
    , ( "RI", [ 0 ] )
    , ( "SC", [ 2 ] )
    , ( "SD", [ 2 ] )
    , ( "TN", [ 31 ] )
    , ( "TX", [ 76 ] )
    , ( "UT", [ 2 ] )
    , ( "VA", [ 23 ] )
    , ( "VT", [ 1 ] )
    , ( "WA", [ 80 ] )
    , ( "WI", [ 42 ] )
    , ( "WV", [ 0 ] )
    , ( "WY", [ 0 ] )
    ]
