-- Trigger: 2 Expedition targets capture
-- Pattern (regex): ^Find and (kill|spar with) (?<target>.*) in (?<area>.*)\.
-- Description: Capture all lines with the given prefix and write them to a table with color.

ui = ui or {}

if ui.capturingExpedTargets then
  local t = ("<green>"..matches.target.." <white>in <yellow>"..matches.area)
  table.insert(ui.eTargets, t)
end