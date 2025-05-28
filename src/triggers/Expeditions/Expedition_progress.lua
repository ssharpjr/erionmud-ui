-- Name: Expedition progress
-- Pattern:
--  (regex): ^You have completed a part of your EXPEDITION
--  (regex): ^You have almost (?<comp>\w+) your EXPEDITION
-- Description: Updates the top console that all targets have been eliminated.


ui = ui or {}

if matches.comp then
  ui.TopContainerMC:clear()
  ui.TopContainerMC:cecho("<orange_red>EXPEDITION!---------------------------------------------------------------------------\n")
  ui.TopContainerMC:cecho("<green>Complete! Return to the Expedition Giver!\n")
else
  send("expedition info")
end