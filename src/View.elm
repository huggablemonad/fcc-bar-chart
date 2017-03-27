module View exposing (view)

{-| This module contains functions to represent the application state as HTML.

@docs view

-}

-- Standard library imports (elm-lang/*).

import Dict exposing (Dict)
import Html exposing (Html)
import Html.Attributes as Html
import Svg exposing (Svg)
import Svg.Attributes as Svg


-- 3rd party library imports.

import Plot


-- Application specific imports.

import Data
import Model exposing (Model)
import Messages exposing (Msg(..))


{-| View the application state as HTML.
-}
view : Model -> Html Msg
view model =
    Html.div
        []
        [ viewTitle
        , viewBarChart model
        , viewDataSource
        ]


{-| Chart title.
-}
viewTitle : Html Msg
viewTitle =
    Html.h1
        []
        [ Html.text "Class I (Dangerous) Food Recalls in 2016" ]


{-| View the bar chart as HTML.
-}
viewBarChart : Model -> Html Msg
viewBarChart model =
    let
        oneHintBar data =
            myHintGroup
                (Model.getHovering model)
                (Tuple.first data)
                (Tuple.second data)

        allHintBars =
            List.map oneHintBar
                |> column

        plotCustomizations =
            let
                default =
                    Plot.defaultBarsPlotCustomizations
            in
                { default
                    | width =
                        1440
                    , onHover =
                        Just Hover
                    , hintContainer =
                        Model.getHovering model
                            |> Plot.flyingHintContainer Plot.normalHintContainerInner
                }
    in
        Data.get
            |> Plot.viewBarsCustom plotCustomizations allHintBars


{-| URL of the data source.
-}
viewDataSource : Html Msg
viewDataSource =
    Html.p
        []
        [ Html.text "Source: "
        , Html.a
            [ Html.href "https://open.fda.gov/food/enforcement/" ]
            [ Html.text "FDA food recall enforcement reports" ]
        ]


{-| Column chart.

This is a modified version of @histogram@ in @Plot@.
-}
column : (data -> List Plot.BarGroup) -> Plot.Bars data msg
column toGroups =
    { axis = Plot.normalAxis
    , toGroups = toGroups
    , styles = [ [ Svg.id "bar-chart" ] ]
    , maxWidth = Plot.Percentage 100
    }


{-| For groups with a hint.

This is a modified version of the one in @Plot@.
-}
myHintGroup : Maybe Plot.Point -> String -> List Float -> Plot.BarGroup
myHintGroup hovering label heights =
    { label = normalBarLabel label
    , verticalLine = onHovering (Plot.fullLine [ Svg.id "hint-line" ]) hovering
    , hint = \g -> onHovering (Html.div [] <| List.map (normalHint label) heights) hovering g
    , bars = List.map (Bar Nothing) heights
    }


{-| A plain bar label.

Copied verbatim from @Plot@.
-}
normalBarLabel : String -> Float -> Plot.LabelCustomizations
normalBarLabel label position =
    { position = position
    , view = Plot.viewLabel [] label
    }


{-| Custom HTML for the hint.

This is a modified version of the one in @Plot@.
-}
normalHint : String -> Float -> Html msg
normalHint label y =
    let
        stateName =
            Dict.get label states
                |> Maybe.withDefault label

        recall =
            if y == 1 then
                " recall"
            else
                " recalls"
    in
        Html.span
            [ Html.id "hint" ]
            [ Html.text (stateName ++ ": " ++ toString y ++ recall) ]


{-| Helper for hints.

Copied verbatim from @Plot@.
-}
onHovering : a -> Maybe Plot.Point -> Float -> Maybe a
onHovering stuff hovering x =
    Maybe.andThen
        (\p ->
            if p.x == x then
                Just stuff
            else
                Nothing
        )
        hovering


{-| Label and value for a single bar.

Copied verbatim from @Plot@.
-}
type alias Bar =
    { label : Maybe (Svg Never)
    , height : Float
    }


{-| Return the full name of a state when given its postal abbreviation.
-}
states : Dict String String
states =
    Dict.fromList
        [ ( "AK", "Alaska" )
        , ( "AL", "Alabama" )
        , ( "AR", "Arkansas" )
        , ( "AZ", "Arizona" )
        , ( "CA", "California" )
        , ( "CO", "Colorado" )
        , ( "CT", "Connecticut" )
        , ( "DE", "Delaware" )
        , ( "FL", "Florida" )
        , ( "GA", "Georgia" )
        , ( "HI", "Hawaii" )
        , ( "IA", "Iowa" )
        , ( "ID", "Idaho" )
        , ( "IL", "Illinois" )
        , ( "IN", "Indiana" )
        , ( "KS", "Kansas" )
        , ( "KY", "Kentucky" )
        , ( "LA", "Louisiana" )
        , ( "MA", "Massachusetts" )
        , ( "MD", "Maryland" )
        , ( "ME", "Maine" )
        , ( "MI", "Michigan" )
        , ( "MN", "Minnesota" )
        , ( "MO", "Missouri" )
        , ( "MS", "Mississippi" )
        , ( "MT", "Montana" )
        , ( "NC", "North Carolina" )
        , ( "ND", "North Dakota" )
        , ( "NE", "Nebraska" )
        , ( "NH", "New Hampshire" )
        , ( "NJ", "New Jersey" )
        , ( "NM", "New Mexico" )
        , ( "NV", "Nevada" )
        , ( "NY", "New York" )
        , ( "OH", "Ohio" )
        , ( "OK", "Oklahoma" )
        , ( "OR", "Oregon" )
        , ( "PA", "Pennslyvania" )
        , ( "RI", "Rhode Island" )
        , ( "SC", "South Carolina" )
        , ( "SD", "South Dakota" )
        , ( "TN", "Tennessee" )
        , ( "TX", "Texas" )
        , ( "UT", "Utah" )
        , ( "VA", "Virginia" )
        , ( "VT", "Vermont" )
        , ( "WA", "Washington" )
        , ( "WI", "Wisconsin" )
        , ( "WV", "West Virginia" )
        , ( "WY", "Wyoming" )
        ]
