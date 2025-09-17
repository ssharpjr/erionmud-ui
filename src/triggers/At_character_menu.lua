-- Trigger: ^Welcome to the account menu of (.*)
-- Pattern (regex): ^Welcome to the account menu of (.*)
-- Description: Stuff to do when a character logs out.

ui = ui or {}

-- Clear status window
clearWindow("ui.PlayerInfoMC")
cecho("ui.PlayerInfoMC", "<grey><b>Character Status</b>\n")
hecho("ui.PlayerInfoMC", "#9f8e3d#b------------------------------------\n")
cecho("ui.PlayerInfoMC", "\n\n<white>       Waiting for \n  character information...\n")

-- Clear any previous character variables
ui.PlayerName = nil
ui.ActiveClass = nil
ui.ActiveClassLevel = nil
ui.PClass = nil
ui.PSubclass = nil
ui.SecClass = nil
ui.SecSubclass = nil
