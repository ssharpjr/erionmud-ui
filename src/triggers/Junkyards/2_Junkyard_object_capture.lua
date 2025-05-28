-- Capture all junkyard targets

ui = ui or {}

local num = matches.num
local item = matches.item
local room = matches.room
local area = matches.area

if ui.capturingJunkyardObjects then
  if string.find(area, "here") then
    area = string.sub(area, 1, -7)
    area = area.."<red>(here)"
  end
  local t = "<white>"..num..": <green>"..item.."<gray> in <yellow>"..room.."<gray> in <cyan>"..area
  table.insert(ui.junkyardObjects, t)
end
