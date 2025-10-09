-- Trigger: ExitsCapture
-- Pattern (regex): ^\[Exits\:\s(.*)\]

map = map or {}  -- From generic_mapper

if map.prompt then
  map.prompt.exits = matches[2]
end

clearWindow("ui.ExitsMC")
selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
copy()
ui.ExitsMC:appendBuffer()
replaceLine("")

-- ui.mapReady = false
-- cecho("\n<orange_red>[DEBUG]: Exits trigger fired → mapReady reset to false\n")