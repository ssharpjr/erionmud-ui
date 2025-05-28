-- Name: Clear console
-- Pattern: ^uiclear (\w+)?$
-- Description: Clear the given console

ui = ui or {}

local top = ui.TopContainerMC
local right = ui.ChatMC

if matches[2] == "top" then
  top:clear()
  uiCecho("Top console cleared")
elseif matches[2] == "right" then
  right:clear()
  uiCecho("Right console cleared")
else
  uiCecho("Usage: uiclear top|right")
end