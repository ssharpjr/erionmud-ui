-- Trigger: Map Trigger (Border)
-- Pattern (regex): (^\+-{9}\+\s{2})

ui = ui or {}

if CMap == 0 then
  ui.AnsiMapMC:clear()
  selectCaptureGroup(1)
  setBgColor(unpack(ui.BgColorRGB))
  copy()
  ui.AnsiMapMC:appendBuffer()
  replace()
  
  CMap = 1
else
  selectCaptureGroup(1)
  setBgColor(unpack(ui.BgColorRGB))
  copy()
  ui.AnsiMapMC:appendBuffer()
  replace()
  CMap = 2
end

if CMap == 2 then
  CMap = 0
end
