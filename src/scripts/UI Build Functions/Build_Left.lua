-- Functions to build the left UI
-- The layout is:
-- - A main container at 100% of the needed space.
-- - A main label for applying stylesheets to the container. 
--   - This should be slightly smaller than the main container (5px).
-- - MiniConsoles inside the main label as needed.
--   - These should be slightly smaller than the main label (5px).

ui = ui or {}

function BuildLeft()

  --============================================================
  -- Main Left Container and Main Label
  --============================================================
  ui.LeftContainer = ui.LeftContainer or Adjustable.Container:new({
    name = "ui.LeftContainer",
    titleText = "Left Container",
    x = 0,
    y = 0,
    width = ui.LeftContainerWidth,
    height = "100%",
    attached = "left",
    autoSave = false,
    autoLoad = false,
    adjLabelstyle = ui.MainAdjLabelStyle,
    buttonstyle = ui.MainButtonStyle,
  })
  
  ui.LeftContainer:lockContainer(ui.LockStyle)
  ui.LeftContainer:changeMenuStyle("dark")
  
  -- Main Left Label
  ui.LeftContainerLabel = Geyser.Label:new({
    name = "ui.LeftContainerLabel",
    x = 0, y = 0,
    width = "100%",
    height = "100%",
  }, ui.LeftContainer)  -- Attach to the main left container
  
  -- Main Left Label Stylesheet
  ui.LeftContainerLabel:setStyleSheet(ui.MainStyleSheet)
  
  
  --============================================================
  -- Game Logo
  --============================================================  
  ui.GameNameLabel = Geyser.Label:new({
    name = "ui.GameNameLabel",
    x = 5, y = 5, -- Compensate for the rounded borders
    width = "100%-10",
    height = "5%",
    color = ui.BgColor,
  }, ui.LeftContainerLabel)  -- Attach to the main left label

  ui.GameNameLabel:setFont("Copperplate Gothic Light")
  ui.GameNameLabel:setFontSize(20)
  ui.GameNameLabel:echo(ui.GameName, "#afa15a", "cub")
  
  --Debug
  local debugGameNameLabel = false
  if debugGameNameLabel then
    ui.GameNameLabel:setStyleSheet(ui.DebugSS)
  end
    
  
  --============================================================
  -- Player Information
  --============================================================
  ui.PlayerInfoLabel = Geyser.Label:new({
    name = "ui.PlayerInfoLabel",
    x = 5,
    y = "5%+10",
    width = "100%-10",
    height = "40%",
    color = ui.BgColor,
  }, ui.LeftContainerLabel)
  
  --ui.PlayerInfoLabel:setFont("Bitstream Vera Sans Mono")
  --ui.PlayerInfoLabel:setFontSize(10)
  --ui.PlayerInfoLabel:echo("<b>Player Info</b>")
  --ui.PlayerInfoLabel:setStyleSheet([[
  -- qproperty-alignment: 'AlignLeft | AlignTop';
  --]])
  
  ui.PlayerInfoMC = Geyser.MiniConsole:new({
    name = "ui.PlayerInfoMC",
    x = 5,
    y = 5,
    width = "100%-10",
    height = "100%-10",
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    fontSize = 10,
  }, ui.PlayerInfoLabel)
  
  ui.PlayerInfoMC:disableScrolling()

  
  --Debug
  local debugPlayerInfoLabel = false
  if debugPlayerInfoLabel then
    ui.PlayerInfoLabel:setStyleSheet(ui.DebugSS)
    ui.PlayerInfoMC:setColor("gray")
  end
  

  --============================================================
  -- ANSI Map
  --============================================================
  ui.AnsiMapLabel = Geyser.Label:new({
    name = "ui.AsciiMapLabel",
    x = 5,
    y = "50%",
    width = "100%-10",
    height = "50%-5",
    color = ui.BgColor,
    --color = "black",
  }, ui.LeftContainerLabel)
  
  --Debug
  local debugAnsiMapLabel = false
  if debugAnsiMapLabel then
    ui.AnsiMapLabel:setStyleSheet(ui.DebugSS)
  end
  
  -- ANSI Map Name Block
  ui.AnsiMapNameMC = Geyser.MiniConsole:new({
    name = "ui.AnsiMapNameMC",
    x = 5,
    y = 5,
    width = "100%-10",
    height = 90,
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    --color = "cyan",
    fontSize = 10
  }, ui.AnsiMapLabel)
  
  ui.AnsiMapNameMC:disableScrolling()
    
  -- ANSI Map
  ui.AnsiMapMC = Geyser.MiniConsole:new({
    name = "ui.AnsiMapMC",
    x = ui.AnsiMapLeftMargin,
    y = "100%-340",
    width = ui.AnsiMapWidth,
    height = 265,
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    --color = "black",
    fontSize = 15,
  }, ui.AnsiMapLabel)
  
  ui.AnsiMapMC:disableScrolling()
  
  -- Exits
  ui.ExitsMC = Geyser.MiniConsole:new({
    name = "ui.ExitsMC",
    x = 10,
    y = "100%-55",
    width = "80%",
    height = 50,
    autoWrap = true,
    scrollBar = false,
    color = ui.BgColor,
    --color = "black",
    fontSize = 10,
  }, ui.AnsiMapLabel)  
  
  ui.ExitsMC:disableScrolling()
  
end