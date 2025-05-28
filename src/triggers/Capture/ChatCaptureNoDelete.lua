-- Move all chat text to a buffer

selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
copy()
-- if string.find(matches[1], "QUEST") or 
   -- string.find(matches[1], "EXPEDITION") then
  -- if ui.onExpedition ~= true or ui.onQuest ~= true then
    -- ui.TopContainerMC:clear()
    -- ui.TopContainerMC:appendBuffer()
    -- tempTimer(60, function() ui.TopContainerMC:clear() end)
  -- end
-- end

setBgColor(0,0,0)  -- Reset background color to black
--deleteLine() --Remove Captured Line (Comment out to disable)


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