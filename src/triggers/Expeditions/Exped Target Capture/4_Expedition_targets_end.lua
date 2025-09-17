-- Trigger: 4 Expedition targets end
-- Pattern (substring): ------------------------------------------------------------
-- Description: Write target and area to the top console in 2 rows.

ui = ui or {}

if ui.capturingExpedTargets then
  ui.capturingExpedTargets = false
  
  -- Clear the header and footer if it was captured
  if ui.eTargets == "-------------------[ Expedition Targets ]-------------------" then
    table.remove(eTargets, 1)  -- Pop the first entry
  end
  if ui.eTargets == "------------------------------------------------------------" then
    table.remove(eTargets, #eTargets)  -- Pop the last entry
  end
    
  ui.TopContainerMC:clear()
  ui.TopContainerMC:cecho("<orange_red>EXPEDITION!---------------------------------------------------------------------------\n")
  
  for i = 1, #ui.eTargets, 2 do
    local first = ui.eTargets[i] or ""
    local second = ui.eTargets[i + 1] or ""
    ui.TopContainerMC:cecho(string.format("%-65s %s\n", first, second))  -- string.format adds spacing.
  end
end