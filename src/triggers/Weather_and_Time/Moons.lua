-- TODO: Capture moon events
ui = ui or {}

if matches.moon == "red" then ui.RedMoonRising = true end
if matches.moon == "white" then ui.WhiteMoonRising = true end

setBgColor(0,25,0)