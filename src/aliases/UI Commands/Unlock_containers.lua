-- Unlock containers
-- Options are (all, left, top, right, bottom)

local con = matches.con

if con == "all" then
  ui.LeftContainer:unlockContainer()
  ui.TopContainer:unlockContainer()
  ui.RightContainer:unlockContainer()
  ui.BottomContainer:unlockContainer()
elseif con == "left" then
  ui.LeftContainer:unlockContainer()
elseif con == "top" then
  ui.TopContainer:unlockContainer()
elseif con == "right" then
  ui.RightContainer:unlockContainer()
elseif con == "bottom" then
  ui.BottomContainer:unlockContainer()
else
  cecho("\n<orange_red>Usage: uiunlock (left|top|right|bottom)\n")
end