-- UI Functions

ui = ui or {}

-- Create a simple table/DB for saving/loading persistent data.
function SaveUISettings()
  --local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
  --local filename = getMudletHomeDir()..separator.."erionmud_ui_settings.db"
  local filename = getMudletHomeDir().."/erionmud_ui_settings.db"
  if ui.SettingsDB then
    table.save(filename, ui.SettingsDB)
  else
    tempTable = {}
    table.save(filename, tempTable)
  end
end


function LoadUISettings()
  local file_exists = io.open(getMudletHomeDir().."/erionmud_ui_settings.db") ~= nil
  if file_exists == false then
    SaveUISettings()
  end
  local filename = getMudletHomeDir().."/erionmud_ui_settings.db"
  ui.SettingsDB = {}
  table.load(filename, ui.SettingsDB)
end


function uiCecho(text)
  -- Add the UI prefix "-=[UI]=-" to each echo
  
  -- This one is dimmer and more mellow
  --cecho("<royal_blue>-<forest_green>=<ansi_yellow>[<steel_blue>UI<ansi_yellow>]<forest_green>=<royal_blue>- <reset>"..text)
  
  -- This one is brighter
  cecho("<forest_green>-<green>=<gold>[<cyan>UI<gold>]<green>=<forest_green>- <yellow>"..text.."<reset>")
end


--A counter to keep ScoreBuffer/Window clean
  function CleanScoreBuffer ()
    if Score_Buffer_Count == 0 then
      clearWindow("ScoreBuffer")
      Score_Buffer_Count = 0
      Score_Buffer_Count = Score_Buffer_Count + 1
    elseif Score_Buffer_Count == 23 then
      Score_Buffer_Count = 0
    else
      Score_Buffer_Count = Score_Buffer_Count + 1
    end
  end


  function SilentScoreCapture()
    send("score", false)
    tempTrigger("For more character information use aff, mults, sigil, worth, and whois.",
      function()
        moveCursor("main", 1, getLastLineNumber("main")-1)
        for i = 0, 24, 1 do
          deleteLine()
          moveCursorDown()
        end
      end, 1)
  end


function GetClasses()
  enableTrigger("ScoreClassCaptures")
  --send("score", false)
  SilentScoreCapture()
end