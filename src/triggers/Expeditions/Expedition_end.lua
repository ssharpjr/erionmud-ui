-- Trigger: Expedition end
-- Pattern (regex): ^You inform (.*) you have completed (\w+) expedition
-- Pattern (regex): ^You have failed your expedition
-- Description: Updates top console and kill timer when expedition is not active.

ui = ui or {}

ui.TopContainerMC:clear()
killTimer(ui.expedBonusTimer)
ui.expedBonusTimer = "0"

-- Optional stuff from the ErionMud GamePack
if gp.version then
  cecho("\n<orange_red>Buff trigger activated")
  enableTrigger("Buffs")
  expandAlias("cr on")
end