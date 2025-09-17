-- Trigger: PlayerCapture
-- Pattern (regex): ^Logging in as (\w+)\.
-- Description: Capture the active player name on log in.

ui = ui or {}

if (ui.PlayerName ~= matches[2]) or (ui.PlayerName == nil) or (ui.PlayerName == "") then
  ui.PlayerName = matches[2]
  tempTimer(0.5, function() send("look", false) end)
end