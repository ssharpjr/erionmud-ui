ui = ui or {}

-- Resize the UI if the Mudlet window is resized.
function ResizeUI(event)
  -- Get fresh dimensions
  BuildLayout()
  
  -- Set new dimensions
  local leftW  = ui.LeftContainerWidth
  local leftH  = ui.mh
  
  local topX   = ui.LeftContainerWidth + ui.containerPadding.base
  local topY   = 0
  local topW   = ui.TopContainerWidth - ui.containerPadding.top
  local topH   = ui.TopContainerHeight
  
  local botX   = topX
  local botY   = ui.mh - ui.BottomContainerHeight
  local botW   = topW
  local botH   = ui.BottomContainerHeight
  
  local rightX = ui.mw - ui.RightContainerWidth
  local rightY = 0
  local rightW = ui.RightContainerWidth - ui.containerPadding.right
  local rightH = (ui.mh - botH) - ui.containerPadding.base
  
  -- Apply new dimensions to the containers
  ui.LeftContainer:set_constraints({x = 0, y = 0, width = leftW, height = leftH})
  ui.LeftContainer:reposition()
  ui.TopContainer:set_constraints({x = topX, y = topY, width = topW, height = topH})
  ui.TopContainer:reposition()
  ui.BottomContainer:set_constraints({x = botX, y = botY, width = botW, height = botH})
  ui.BottomContainer:reposition()
  ui.RightContainer:set_constraints({x = rightX, y = rightY, width = rightW, height = rightH})
  ui.RightContainer:reposition()
  
  -- Update the Command Prompt position
  SetCMDStyle() -- Function in UI_Build_Functions/Build_Bottom
  
  -- Update the Main Window scroll bar
  setBorderRight(ui.RightContainerWidth + ui.containerPadding.right)
  
end

registerAnonymousEventHandler("sysWindowResizeEvent", function()
  tempTimer(0.05, ResizeUI)  -- Debounce while dragging the window.
end)