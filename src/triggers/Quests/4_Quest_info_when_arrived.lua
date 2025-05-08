-- Show Quest varables if on a quest

ui = ui or {}

if ui.questArea then
  cecho("\n<yellow>------------------------------")
  cecho("\n<orange_red>Target: <green>" .. ui.questTarget)
  cecho("\n<orange_red>  Room: <cyan>" .. ui.questRoom)
  cecho("\n<orange_red>  Area: <yellow>" .. ui.questArea)
  cecho("\n<orange_red> Bonus: <white>" .. ui.questBonusTimer)
  cecho("\n<yellow>------------------------------")
  echo("")
  --send("quest info")
end
