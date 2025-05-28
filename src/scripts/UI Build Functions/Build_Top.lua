-- Functions to build the top UI
-- The layout is:
-- - A main container at 100% of the needed space.
-- - A main label for applying stylesheets to the container. 
--   - This should be slightly smaller than the main container (5px).
-- - MiniConsoles inside the main label as needed.
--   - These should be slightly smaller than the main label (5px).

ui = ui or {}

function BuildTop()

  -- Main Top Container
  -- The "ui" dimension variables are defined in the "2 Init UI" script
  ui.TopContainer = ui.TopContainer or Adjustable.Container:new({
    name = "ui.TopContainer",
    titleText = "Top Container",
    x = (ui.LeftContainerWidth + 5), 
    y = 0,
    width = (ui.TopContainerWidth - 10),
    height = ui.TopContainerHeight,
    attached = "top",
    autoSave = false,
    autoLoad = false,
    adjLabelstyle = ui.MainAdjLabelStyle,
    buttonstyle = ui.MainButtonStyle,
  })
  
  ui.TopContainer:changeMenuStyle("dark")
  ui.TopContainer:lockContainer(ui.LockStyle)
  
  -- Main Top Label
  ui.TopContainerLabel = Geyser.Label:new({
    name = "ui.TopContainerLabel",
    x = 0, y = 0,
    width = "100%",
    height = "100%",
  }, ui.TopContainer)  -- Attach to the main top container
  
  -- Main Top Label Stylesheet
  ui.TopContainerLabel:setStyleSheet(ui.MainStyleSheet)
  
  -- Mud Event console
  ui.TopContainerMCTop = Geyser.MiniConsole:new({
    name = "ui.TopContainerMCTop",
    x = 10,
    y = 10,
    width = "100%-20",
    height = 20,
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    fontSize = 9,
  }, ui.TopContainerLabel)
  
  ui.TopContainerMCTop:disableScrolling()

  
  -- Top info console
  ui.TopContainerMC = Geyser.MiniConsole:new({
    name = "ui.TopContainerMC",
    x = 10,
    y = 30,
    width = "100%-20",
    height = "100%-40",
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    fontSize = 9,
  }, ui.TopContainerLabel)
  
  -- ui.TopContainerMC:disableScrolling()  -- This needs to scroll for Junkyards, etc.
   
end