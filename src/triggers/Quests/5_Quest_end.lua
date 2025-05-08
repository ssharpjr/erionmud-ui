-- Clear variables

ui = ui or {}
gp = gp or {}

-- Optional highlight from the Highlighter package
if Highlighter then
  expandAlias("hl item remove "..ui.questTarget)
end

ui.questArea = nil
ui.questRoom = nil
ui.questTarget = nil

killTimer(ui.questBonusTimer)
ui.questBonusTimer = "0"

-- Reset some settings
cecho("\n<orange_red>Quest variables cleared")
enableTrigger("2 Quest info capture")

-- Optional stuff from the ErionMud GamePack
if gp.version then
  cecho("\n<orange_red>Buff trigger activated")
  enableTrigger("Buffs")
  expandAlias("cr on")
end

ui.TopContainerMC:clear()