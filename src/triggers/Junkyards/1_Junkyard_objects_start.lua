--[[
You have 30 minutes left to gather:
[ 1] a smoking wand in Hilly Path in Rambling Roads Highway
[ 2] a gnarled staff in Blackened Hall in Hell
[ 3] an ancient relic in In a Giant Natural Botanical Garden in Jungle of Xyzzyxx
]]

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
