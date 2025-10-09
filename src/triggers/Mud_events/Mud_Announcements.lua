-- Trigger: Mud Announcements
-- Pattern (regex): \<\[announce\]\> (.*)
-- Pattern (regex): ^A Legend has been born\!
-- Description: Capture MUD announcements and send them to the chat and top windows.

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