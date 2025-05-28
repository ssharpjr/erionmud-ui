-- Write to the top container

if ui.capturingExpedTargets then
  ui.capturingExpedTargets = false
  
  -- Clear the header and footer if it was captured
  if ui.eTargets == "-------------------[ Expedition Targets ]-------------------" then
    table.remove(eTargets, 1)
  end
  if ui.eTargets == "------------------------------------------------------------" then
    table.remove(eTargets, #eTargets)
  end
  
  
  ui.TopContainerMC:clear()
  ui.TopContainerMC:cecho("<orange_red>EXPEDITION!---------------------------------------------------------------------------\n")
  
  for i = 1, #ui.eTargets, 2 do
    local first = ui.eTargets[i] or ""
    local second = ui.eTargets[i + 1] or ""
    ui.TopContainerMC:cecho(string.format("%-65s %s\n", first, second))
  end
end