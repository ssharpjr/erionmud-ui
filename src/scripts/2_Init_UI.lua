-- Basic ErionMud UI with layered containers, labels, and miniconsoles

ui = ui or {}

-- Player variables
ui.PlayerName = ""
ui.ActiveClass = ""
ui.ActiveClassLevel = ""
ui.PClass = ""
ui.PSubclass = ""
ui.SecClass = ""
ui.SecSubclass = ""
--ui.PClassLevel = ""
--ui.PSubclassLevel = ""
--ui.SecClassLevel = ""
--ui.SecSubclassLevel = ""

-- Event variables
ui.Exp2k = false
ui.Exp4k = false
ui.SpriteType = nil
ui.SpriteLocation = nil
ui.SpriteTimer = nil

-- Crafting/Skilling variables
-- Fishing
ui.Jiggled = false
ui.JiggleCounter = false

----------------------------------------------------------------------
----------------------------------------------------------------------

--Buffers for word wrapping
  createBuffer("MainBuffer")
  createBuffer("ChatBuffer")
  createBuffer("ScoreBuffer")

-- Debugging StyleSheet - show some borders and such
ui.DebugSS = ([[
    background: black;
    border: 2px solid white;
    border-radius: 10px;
  ]])

function InitUI()
  -- Reset buffer vars
  CMap = 0
  Score_Buffer_Count = 0

  -- Set the main window borders
  setBorderColor(0,0,0)
  setBorderTop(0)
  setBorderBottom(0)
  setBorderLeft(300)
  setBorderRight(0)
  
  -- Calculate container widths
  -- The left container will use 15% of the total screen
  -- The right container will use 25% of the total screen
  -- These can be adjusted as desired once the containers are unlocked.
  ui.mw, ui.mh = getMainWindowSize()
  ui.mcw = getMainConsoleWidth()
  ui.LeftContainerWidth = (ui.mw * 0.15)  -- 15% of the screen
  ui.RightContainerWidth = (ui.mw * 0.25)  -- 25% of the screen
  ui.TopContainerWidth = (ui.mw - (ui.LeftContainerWidth + ui.RightContainerWidth))
  ui.BottomContainerWidth = ui.TopContainerWidth
  ui.TopContainerHeight = 120  -- This is static to hold the needed information
  ui.BottomContainerHeight = 80 -- This is static to hold the needed information
  ui.CmdLineStart = ui.LeftContainerWidth + 10  -- Adjust this offset accordingly
  ui.AnsiMapWidth = 140  -- This is static so the complete map is displayed
  ui.AnsiMapLeftMargin = ((ui.LeftContainerWidth/2) - (ui.AnsiMapWidth/2))  -- Ratio to keep it centered
  
  -- Set Fonts
  setFont("Bitstream Vera Sans Mono")
  setFontSize(11)
  
  -- Styles
  --ui.BorderColor = "#9f8e3d"  -- Erion Gold
  --ui.BgColor = "#0c1510"      -- Erion Green
  --ui.BgColorRGB = {12,21,16}  -- Erion Green in RGB (unpack(table))
  --ui.LockStyle = "full"  -- Hides all borders. The container must be unlocked with a command.
  --ui.MainStyleSheet = [[
  --    background: ]] .. ui.BgColor .. [[ ;
  --    border: 3px solid ]] .. ui.BorderColor .. [[ ;
  --    border-radius: 10px;
  --  ]]
  
  -- Main CSS for adjustable containers
  ui.MainAdjLabelStyle = "background-color:rgba(0,0,0,100%); border: 0px solid rgb(0,0,0);"
  ui.MainButtonStyle = [[
        QLabel{ border-radius: 3px; background-color: rgba(40,40,40,100%);}
        QLabel::hover{ background-color: rgba(60,60,60,50%);}
        ]]
  
  -- Build GUI
  BuildLeft()
  BuildTop()
  BuildBottom()
  BuildRight()
  
end

registerAnonymousEventHandler("InitializeUI", "InitUI")