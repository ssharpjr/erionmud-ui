-- Trigger: Mud Events
-- Pattern: Various
-- Description: Capture MUD events and send them in the top and right containers

--[[
Example: <[mudevent]> Experience gains from 2000 Monster Deaths will end in 2 minutes!
<<< <PLAYER> has killed the 2000th monster! 2x EXP +30 Minutes! >>>
For the next 30 minutes, experience is quadrupled

]]

ui = ui or {}

-- Try to figure out how much of an EXP boost we're getting
local expGain2kStarted = "2000th monster"
local expGain2k = "Experience gains from 2000 Monster Deaths will end"
local expGain2kEnded = "Experience gains from 2000 Monster Deaths have ended"
local expGain4k = "quadrupled"

-- 2X EXP events
if string.find(matches.event, expGain2k) or 
  string.find(matches.event, expGain2kStarted) then
  ui.Exp2k = true
end
if string.find(matches.event, expGain2kEnded) then
  ui.Exp2k = false
  tempTimer(60, [[ ui.TopContainerMCTop:clear() ]])
end

-- 4X EXP events
if string.find(matches.event, expGain4k) then
  ui.Exp4k = true
else
  ui.Exp4k = false
  tempTimer(60, [[ ui.TopContainerMCTop:clear() ]])
end


selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
copy()
ui.TopContainerMCTop:clear()
ui.TopContainerMCTop:appendBuffer()
deleteLine() --Remove Captured Line (Comment out to disable)
cecho("\n<black:dark_goldenrod><b>"..matches[1].."</b>\n\n")

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