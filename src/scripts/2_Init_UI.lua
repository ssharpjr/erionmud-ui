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

--Buffers and such
  createBuffer("MainBuffer")
  createBuffer("ChatBuffer")
    
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
  
  -- Build the initial layout
  BuildLayout()
  
  -- Set Fonts
  setFont("Bitstream Vera Sans Mono")
  setFontSize(11)
    
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