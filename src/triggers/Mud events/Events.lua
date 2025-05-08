-- TODO: Capture other events (still working on this one)

--[[
Num  Name                    Date      Time      Duration Starts In
---- ----------------------- --------- --------- -------- ------------
[7 ] Bloodbath (War)         Wednesday 19:45 EST   0h 30m In Progress! 
[8 ] Well-Traveled Mudder    Wednesday 20:15 EST   0h 45m   0d  0h 15m 

]]

ui = ui or {}
ui.CurrentEvent = matches.event

local mudevent = "Event: "..ui.CurrentEvent
--selectCurrentLine()
setBgColor(unpack(ui.BgColorRGB))
--copy()
ui.TopContainerMCTop:appendBuffer(mudevent)
