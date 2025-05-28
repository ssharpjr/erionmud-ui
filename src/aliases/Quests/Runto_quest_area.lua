-- Run to the selected area

ui = ui or {}
gp = gp or {}

if ui.questArea then
  
  -- Optional from the ErionMud Game Pack
  if gp.version then
    expandAlias("cr off")
    disableTrigger("Buffs")
  end
  
  send("recall;;runto " .. ui.questArea)  -- Most runtos are faster from recall
else
  uiCecho("<orange_red>Quest Area not set!")
end