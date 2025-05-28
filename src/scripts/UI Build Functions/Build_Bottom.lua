-- Functions to build the bottom UI
-- The layout is:
-- - A main container at 100% of the needed space.
-- - A main label for applying stylesheets to the container. 
--   - This should be slightly smaller than the main container (5px).
-- - MiniConsoles inside the main label as needed.
--   - These should be slightly smaller than the main label (5px).

ui = ui or {}

function BuildBottom()

  -- Main Bottom Container
  -- The "ui" dimension variables are defined in the "2 Init UI" script
  ui.BottomContainer = ui.BottomContainer or Adjustable.Container:new({
    name = "ui.BottomContainer",
    titleText = "Bottom Container",
    x = (ui.LeftContainerWidth + 5), 
    y = "100%-80",
    width = (ui.BottomContainerWidth - 10),
    height = ui.BottomContainerHeight,
    attached = "bottom",
    autoSave = false,
    autoLoad = false,
    adjLabelstyle = ui.MainAdjLabelStyle,
    buttonstyle = ui.MainButtonStyle,
  })
  
  ui.BottomContainer:changeMenuStyle("dark")
  ui.BottomContainer:lockContainer(ui.LockStyle)
  
  -- Main Bottom Label
  ui.BottomContainerLabel = Geyser.Label:new({
    name = "ui.BottomContainerLabel",
    x = 0, y = 0,
    width = "100%",
    height = "100%",
  }, ui.BottomContainer)  -- Attach to the main bottom container
  
  -- Main Bottom Label Stylesheet
  ui.BottomContainerLabel:setStyleSheet(ui.MainStyleSheet)
  
  
  ui.StatusMC = Geyser.MiniConsole:new({
    name = "ui.StatusMC",
    x = 5,
    y = 12,
    width = "100%-10",
    height = "100%-20",
    autoWrap = false,
    scrollBar = false,
    color = ui.BgColor,
    fontSize = 11,
  }, ui.BottomContainerLabel)

  ui.StatusMC:disableScrolling()
  
  -- Call other functions
  SetCMDStyle()
  SetBarStyle()

end


function SetCMDStyle () --Move Command Line

  setCmdLineStyleSheet("main", [[
    QPlainTextEdit {
      padding-left: ]] .. ui.CmdLineStart .. [[px;       /* change 100 to your number */
      background-color: black;   /* change it to your background color */
    }
  ]])

end

function SetBarStyle () --Sets bar settings
  --Health
  hpbar = Geyser.Gauge:new({
    name="hpbar",
    x = 5,
    y = 0,
    width=120, height=15,
  }, ui.StatusMC)
  hpbar.front:setStyleSheet([[
    background-color: #cc0000;
    border-radius: 2;
  ]])
  hpbar.back:setStyleSheet([[
    background-color: #660000;
    border-radius: 2;
  ]])
  hpbar.text:setStyleSheet([[
    text-align: right;
    padding-right: 5px;
  ]])
  hpbar:setAlignment("center")

  --Energy
  enbar = Geyser.Gauge:new({
    name="enbar",
    x = 5,
    y = 20,
    width=120, height=15,
  }, ui.StatusMC)
  enbar.front:setStyleSheet([[
    background-color: #3d85c6;
    border-radius: 2;
  ]])
  enbar.back:setStyleSheet([[
    background-color: #073763;
    border-radius: 2;
  ]])
  enbar.text:setStyleSheet([[
    text-align: right;
    padding-right: 5px;
  ]])
  enbar:setAlignment("center")
end