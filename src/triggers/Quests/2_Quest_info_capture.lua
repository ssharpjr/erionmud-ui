-- TODO: Work on regex to capture all areas



ui = ui or {}
ui.questArea = matches.area
ui.questRoom = matches.room
ui.questTarget = matches.target

send("quest info")

-- Write Quest report to the top console
ui.TopContainerMC:clear()
ui.TopContainerMC:cecho("\n<yellow>QUEST!----------------------------------------")
ui.TopContainerMC:cecho("\n<orange_red>  Target: <green>" .. matches.target)
ui.TopContainerMC:cecho("\n<orange_red>    Area: <yellow>" .. matches.area)
ui.TopContainerMC:cecho("\n<orange_red>    Room: <cyan>" .. matches.room)
ui.TopContainerMC:cecho("\n<yellow>--------------------------------------------\n")

uiCecho("<yellow>--------------------------------------------\n")
uiCecho("<orange_red>Use: <green>rtq <orange_red>to runto <yellow>" .. matches.area .. "\n")
uiCecho("<yellow>--------------------------------------------\n\n")

disableTrigger("2 Quest info capture")

-- Optional: Add a highlight using the 'Highlighter' package
if Highlighter then
  expandAlias("hl item add quest#"..ui.questTarget)
end