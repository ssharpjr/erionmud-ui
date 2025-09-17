-- Trigger: 1 Junkyard objects start
-- Pattern (regex): ^You ask The Giver for a junkyard quest
-- Pattern (regex): ^You have (\d+) minutes left to gather\:
-- Pattern (regex): ^You have (\d+) minutes and (\d+) seconds left to gather\:
-- Pattern (regex): ^You have (\d+) hour (\d+) minutes and (\d+) seconds left to gather\:

ui = ui or {}

ui.junkyardObjects = {}
ui.capturingJunkyardObjects = true
ui.onJunkyard = true
enableTrigger("2 Junkyard object capture")

-- Use a timer to disable the capture since we do not have an ending string.
tempTimer(2, function() 
  disableTrigger("2 Junkyard object capture")
  ui.capturingJunkyardObjects = false
  
  -- Display the objects in the top console
  ui.TopContainerMC:clear()
  ui.TopContainerMC:cecho("<orange_red>JUNKYARD!---------------------------------------------------------------------------\n")
  
  for i = 1, #ui.junkyardObjects, 1 do
    -- local first = ui.junkyardObjects[i] or ""
    -- local second = ui.junkyardObjects[i + 1] or ""
    -- ui.TopContainerMC:cecho(string.format("%-65s %s\n", first, second))  -- string.format adds spacing.
    ui.TopContainerMC:cecho(ui.junkyardObjects[i].."\n")
  end
end)
