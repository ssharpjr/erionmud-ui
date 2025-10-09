-- Name: Clear console
-- Pattern: ^uiclear\s?(\w+)?$
-- Description: Clear the given console
-- - Options: top, toptop, right, chat

ui = ui or {}

local top = ui.TopContainerMC
local toptop = ui.TopContainerMCTop
local right = ui.ChatMC

if matches[2] == "top" then
  top:clear()
  uiCecho("Top console cleared")
elseif matches[2] == "toptop" then
  toptop:clear()
  uiCecho("Top Top console cleared")
elseif (matches[2] == "right") or (matches[2] == "chat") then
  right:clear()
  uiCecho("Right console cleared")
else
  uiCecho("Usage: uiclear top|toptop|right")
end