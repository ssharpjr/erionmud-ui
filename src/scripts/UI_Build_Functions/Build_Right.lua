-- Functions to build the right UI
-- The layout is:
-- - A main container at 100% of the needed space.
-- - A main label for applying stylesheets to the container. 
--   - This should be slightly smaller than the main container (5px).
-- - MiniConsoles inside the main label as needed.
--   - These should be slightly smaller than the main label (5px).

ui = ui or {}


function BuildRight()
  -- The "ui" dimension variables are defined in the "2 Init UI" script
  ui.RightContainer = ui.RightContainer or Adjustable.Container:new({
    Name = "ui.RightContainer",
    titleText = "Right Container",
    x = "-25%", 
    y = 0,
    width = ui.RightContainerWidth,
    height= "100%-75",
    attached = "right",
    autoSave = false,
    autoLoad = false,
    adjLabelstyle = ui.MainAdjLabelStyle,
    buttonstyle = ui.MainButtonStyle,
  })
  
  ui.RightContainer:changeMenuStyle("dark")
  ui.RightContainer:lockContainer(ui.LockStyle)

  -- Main Right Label
    ui.RightContainerLabel = Geyser.Label:new({
      name = "ui.RightContainerLabel",
      x = 0, y = 0,
      width = "100%",
      height = "100%-10",
    }, ui.RightContainer)  -- Attach to the main right container
    
    -- Main Right Label Stylesheet
    ui.RightContainerLabel:setStyleSheet(ui.MainStyleSheet)


    ui.ChatMC = Geyser.MiniConsole:new({
    name = "ui.ChatMC",
    x = 10,
    y = 20,
    width="100%-20",
    height="100%-40",
    autoWrap = true,
    scrollBar = false,
    color = ui.BgColor,
    fontSize = 11,
  }, ui.RightContainerLabel)

end


