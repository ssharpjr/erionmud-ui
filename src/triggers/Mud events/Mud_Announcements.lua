-- Capture MUD announcements

--[[
<[announce]> Copyover Incoming!
<[announce]> Copyover by Aelyn in 1 minute.
<[announce]> Copyover by Aelyn in 30 seconds.
<[announce]> Copyover by Aelyn in 5 seconds.
<[announce]> Copyover by Aelyn in 4 seconds.
<[announce]> Copyover by Aelyn in 3 seconds.
<[announce]> Copyover by Aelyn in 2 seconds.
<[announce]> Copyover by Aelyn in 1 second.


* * * Aelyn has initiated a copyover * * *

The gods attempt to set time in motion...

Time begins to move again.
]]

ui = ui or {}

selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
copy()
ui.TopContainerMCTop:clear()
ui.TopContainerMCTop:appendBuffer()
deleteLine() --Remove Captured Line (Comment out to disable)
cecho("\n<black:goldenrod><b>" .. matches[1] .. "</b>\n\n")

-- Clear the line from the top container after some time
--tempTimer(10, function() ui.TopContainerMC:clear() end)

moveCursorEnd("MainBuffer")
selectCurrentLine("MainBuffer")
deleteLine("MainBuffer")

moveCursorUp(2)
--selectCurrentLine()

for i = 1, 3, 1 do
  if getCurrentLine() == "" then
    --debugc("Deleted: "..getCurrentLine())
    deleteLine()
  end
  moveCursorDown()
  selectCurrentLine()
end


appendBuffer("ui.ChatMC")
appendBuffer("ChatBuffer")