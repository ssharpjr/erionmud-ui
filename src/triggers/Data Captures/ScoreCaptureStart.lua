-- Trigger: ScoreCaptureStart
-- Regex: ^\+-{70,}\+$   (matches top/bottom border lines with 70+ dashes)
-- Description: This trigger is enabled by: Scripts/ErionMud-UI/UI Functions/
-- - SilentScoreCapture() and GetClasses()

ui = ui or {}
if not ui.scoreInProgress then return end

if not ui.scoreStartLine then
  ui.scoreStartLine = getLineNumber()
end
