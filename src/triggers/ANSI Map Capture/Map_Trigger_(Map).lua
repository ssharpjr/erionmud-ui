-- Trigger: Map Trigger (Map)
-- Pattern (regex): (^\|.{9}\|\s{2})

ui = ui or {}

selectCaptureGroup(1)
setBgColor(unpack(ui.BgColorRGB))
copy()
ui.AnsiMapMC:appendBuffer()
replace("")
