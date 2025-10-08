-- Trigger: ChatCapture
-- Pattern: Various
-- Description: Move all chat text to the Chat buffer and window.

selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))

-- Set some custom colors
if matches[1] == "[mudlet]" then
  setFgColor(255,170,0)
end

if matches[1] == "[secrets]" then
  setFgColor(170, 85, 255)
end

if matches[1] == "(Gtell):" then
  setFgColor(255,0,255)
end

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