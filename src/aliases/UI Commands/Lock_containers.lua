-- Lock containers
-- Options are (all, left, top, right, bottom)

local con = matches.con

if con == "all" then
  ui.LeftContainer:lockContainer()
  ui.TopContainer:lockContainer()
  ui.RightContainer:lockContainer()
  ui.BottomContainer:lockContainer()
elseif con == "left" then
  ui.LeftContainer:lockContainer()
elseif con == "top" then
  ui.TopContainer:lockContainer()
elseif con == "right" then
  ui.RightContainer:lockContainer()
elseif con == "bottom" then
  ui.BottomContainer:lockContainer()
else
  cecho("\n<orange_red>Usage: uilock (left|top|right|bottom)\n")
end