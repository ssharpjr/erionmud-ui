-- Trigger: Junkyard progress
-- Pattern (regex): ^You have (?<almost>\w+) completed your JUNKYARD
-- Pattern (regex): ^You add another piece of (?<trash>\w+) to your junkyard box

ui = ui or {}

if matches.trash then
  send("junkyard info")
end

if matches.almost then
  ui.TopContainerMC:cecho("<orange_red>JUNKYARD!---------------------------------------------------------------------------\n")
  ui.TopContainerMC:cecho("<green>Complete! Return to the Expedition Giver!\n")
end