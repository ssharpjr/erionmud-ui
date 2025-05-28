
-----------------------------------------------------------------------
-- ErionMud UI
---------------
--
-- A UI for Erion Mud (www.erionmud.com)
--
-- Authors: 
--   Daikojun (github.com/ssharpjr) 
--   Many core components and code came from "ErionUI 1.0" by Caelinus
--     (https://github.com/caelinus/ErionMud-UI)
--
-----------------------------------------------------------------------

-- Create a namespace for the UI
ui = ui or {}

function StartUp()
-- Set initial variables
  ui.version = "v1.1"
  ui.GameName = "ErionMud"
  ui.SettingsDB = {}
  LoadUISettings()
  
  uiCecho("ErionMud UI <cyan>"..ui.version.. " <green>Loaded<reset>\n")
  uiCecho("<yellow>Enter '<cyan>uitheme<yellow>' to change the theme")
  
  -- Set the theme
  if ui.SettingsDB["theme"] then
    ui.CurrentTheme = ui.SettingsDB["theme"]
    ui.CurrentThemeName = ui.SettingsDB["theme_name"]
  else
    ui.CurrentTheme = "er"
    ui.CurrentThemeName = "Erion Green"
  end
  SetTheme(ui.CurrentTheme)
  echo("\n\n")
    
  ui.StartUp = true  -- Hold off certain triggers while this is true
  
  
  -- Initialize the UI!
  raiseEvent("InitializeUI")
  
  tempRegexTrigger("Welcome to Erion!|Reconnecting",
    function()
      raiseEvent("SetDefaultMudSettings")
      local ConnectType = matches[1]
      --echo("\n Match: " .. ConnectType)
      
      tempTimer(1, function()
        echo("\n\n")
        uiCecho("<green>ErionMud UI <cyan>"..ui.version.."<reset>\n")
        uiCecho("<yellow>Enter '<cyan>uihelp<yellow>' to access the UI help files\n")
        uiCecho("<yellow>Enter '<cyan>uitheme<yellow>' to change the theme\n")
        cecho("\n\n<green>*<yellow>*<green>* <white>Vote on TMC   : ")
        cechoLink("<cyan>https://bit.ly/354iWXE <purple><--- click me!)", function() openUrl("https://bit.ly/354iWXE") end, 
          "Vote for Erion on TMC!", true)
        cecho(" <green>*<yellow>*<green>*\n")
        
        
        -- Send to the top container as well
        ui.TopContainerMC:clear()
        cecho("ui.TopContainerMC","<forest_green>-<green>=<gold>[<cyan>Welcome to the <green>ErionMud <cyan>UI!<gold>]<green>=<forest_green>-\n")
        cecho("ui.TopContainerMC","<yellow>Enter '<cyan>uihelp<yellow>' to access the UI help files\n")
        cecho("ui.TopContainerMC","<green>*<yellow>*<green>*  <white>Vote for <green>ErionMud <white>on TMC : ")
        cechoLink("ui.TopContainerMC","<cyan>https://bit.ly/354iWXE", function() openUrl("https://bit.ly/354iWXE") end,
          "Vote for Erion on TMC!", true)
        cecho("ui.TopContainerMC","  <green>*<yellow>*<green>*")
        cechoLink("ui.TopContainerMC", "  <purple>(Click to clear)", function() ui.TopContainerMC:clear() end,
          "Click to clear this console", true)
        end)
      
      if ConnectType == "Reconnecting" then
      tempTimer(1.5, [[
        echo("\n")
        send("look")
      ]])
      end
      
      tempTimer(2, [[ ui.StartUp = false ]])
      tempTimer(2.5, [[ GetClasses() ]])
      tempTimer(3, function()
        -- Send Additional commands on login
        send(" ")
        send("mudstats")  -- Get current game stats
        end)
    end, 1)
end

registerAnonymousEventHandler("sysConnectionEvent", "StartUp")