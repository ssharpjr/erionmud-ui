-- Trigger: Sprites
-- Pattern: Various
-- Description: Capture sprite events and send them to the Events list.

--[[
Sprites:
sunsurge (yellow)
lifestream (cyan)
earthguard (green)
windstrike (sky_blue)

Color logic is applied in Scripts/UI Update Functions/UI_UpdateStatus Event (Left)
]]

ui = ui or {}

ui.SpriteType = firstToUpper(matches.sprite) or ""
ui.SpriteLocation = matches.location or ""
ui.SpriteTimer = matches.time or 5


if matches.escaped then
  ui.SpriteType = nil
  ui.SpriteLocation = nil
  ui.SpriteTimer = nil
end

UpdateStatus()