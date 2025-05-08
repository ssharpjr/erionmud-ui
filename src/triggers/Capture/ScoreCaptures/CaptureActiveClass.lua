-- Get the player name and current class

ui = ui or {}

if ui.PlayerName == "" then 
  ui.PlayerName = matches.player
end

ui.ActiveClass = matches.class

disableTrigger("CaptureActiveClass")
--cecho("\n<orange_red>CaptureActiveClass ran")
