-- Get the player's name and current class

ui = ui or {}

if ui.PlayerName == "" then 
  ui.PlayerName = matches.player
end

ui.ActiveClass = matches.class

disableTrigger("CaptureActiveClass")
