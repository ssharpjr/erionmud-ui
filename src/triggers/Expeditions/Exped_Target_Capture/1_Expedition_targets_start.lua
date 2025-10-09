-- Trigger: 1 Expedition targets start
-- Pattern (substring): -------------------[ Expedition Targets ]-------------------
-- Description: Start capturing expedition targets.

ui = ui or {}

ui.eTargets = {}
ui.capturingExpedTargets = true
ui.onExpedition = true

-- Optional stuff from the ErionMud GamePack
if gp.version then
  disableTrigger("Buffs")
  expandAlias("cr off")
end