-- Trigger: ChatCaptureOther
-- Pattern: Various
-- Description: More stuff to move to the Chat buffer and window.

selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
copy()
setBgColor(0,0,0)  -- Reset background color to black
deleteLine() --Remove Captured Line (Comment out to disable)


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