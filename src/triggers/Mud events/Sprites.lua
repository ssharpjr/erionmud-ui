-- ^\<\[mudevent\]\> (.*)

--[[
<[mudevent]> A lifestream sprite has been spotted somewhere in Forgotten Fortress!
<[mudevent]> A lifestream sprite will be departing Forgotten Fortress in 3 minutes!
<[mudevent]> A lifestream sprite has escaped, vanishing from the realm!

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