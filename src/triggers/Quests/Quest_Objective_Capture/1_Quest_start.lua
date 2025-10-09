-- Trigger: 1 Quest start
-- Pattern (regex): ^You ask (.*) for a quest\.$
-- Description: Starting a quest

ui = ui or {}
ui.onQuest = true

-- Optional stuff from the ErionMud GamePack
if gp.version then
  disableTrigger("Buffs")
  expandAlias("cr off")
end

send("quest info")  -- Inform the player and feed the triggers.
