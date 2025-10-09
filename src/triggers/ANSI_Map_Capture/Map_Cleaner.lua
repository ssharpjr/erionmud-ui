-- Trigger: Map Cleaner
-- Pattern (regex): (^ {13})(!C|-)
-- Description: Removes the 13 blank spaces from under the map, bringing the rest of the room description to the left.
--              The "C" and "-" filters prevent the "TRAIN" output from being affected.

selectCaptureGroup(1)
replace("")