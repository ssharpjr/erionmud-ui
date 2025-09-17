-- UI Functions

ui = ui or {}

ui.settingsFile = "/erionmud_ui_settings.db"

-- Create a simple table/DB for saving/loading persistent data.
function SaveUISettings()
  --local separator = string.char(getMudletHomeDir():byte()) == "/" and "/" or "\\"
  --local filename = getMudletHomeDir()..separator.."erionmud_ui_settings.db"
  local filename = getMudletHomeDir()..ui.settingsFile
  if ui.SettingsDB then
    table.save(filename, ui.SettingsDB)
  else
    tempTable = {}
    table.save(filename, tempTable)
  end
end


function LoadUISettings()
  local file_exists = io.open(getMudletHomeDir()..ui.settingsFile) ~= nil
  if file_exists == false then
    SaveUISettings()
  end
  local filename = getMudletHomeDir()..ui.settingsFile
  ui.SettingsDB = {}
  table.load(filename, ui.SettingsDB)
end


function uiCecho(text)
  -- Add the UI prefix "-=[UI]=-" to each echo
  
  -- This one is brighter
  cecho("<forest_green>-<green>=<gold>[<cyan>UI<gold>]<green>=<forest_green>- <yellow>"..text.."<reset>")
  
  -- This one is dimmer and more mellow
  --cecho("<royal_blue>-<forest_green>=<ansi_yellow>[<steel_blue>UI<ansi_yellow>]<forest_green>=<royal_blue>- <reset>"..text)
end


-- Capture and delete a SCORE block silently
function SilentScoreCapture()
  if ui.scoreInProgress then
    -- cecho("<yellow>[WARN] SCORE capture already running; ignored.\n")
    return
  end

  ui.scoreInProgress = true
  ui.scoreStartLine = nil

  enableTrigger("ScoreCaptureStart")
  send("score", false)

  local footerPattern = [[^For more character information use aff, mults, sigil, worth, and whois\.$]]
  local endID
  endID = tempRegexTrigger(footerPattern, function()
    local startLine = ui.scoreStartLine
    local endLine = getLineNumber()

    if not startLine or startLine > endLine then
      -- cecho("<red>[ERROR] SCORE start/end invalid; aborting cleanup.\n")
    else
      local block = getLines("main", startLine, endLine)

      -- Parse stats
      ParseScoreBuffer(block)

      -- Delete captured lines from the main window
      local n = endLine - startLine + 1
      for _ = 1, n do
        moveCursor("main", 1, startLine)
        deleteLine()
      end

      -- cecho(f("<green>[DEBUG] SCORE block captured, parsed, and deleted ({n} lines).\n"))
    end

    if endID then killTrigger(endID) end
    disableTrigger("ScoreCaptureStart")
    ui.scoreStartLine  = nil
    ui.scoreInProgress = false
  end)

  tempTimer(5, function()
    if ui.scoreInProgress then
      -- cecho("<red>[ERROR] SCORE footer not seen; cleaning up.\n")
      if endID then killTrigger(endID) end
      disableTrigger("ScoreCaptureStart")
      ui.scoreStartLine  = nil
      ui.scoreInProgress = false
    end
  end)
end


-- Get/Set stat variables from the captured SCORE output
function ParseScoreBuffer(block)
  for _, line in ipairs(block) do
    -- Player name + active class
    local player, class = line:match("^%|%s+(%w+) the (%w+)%s+%|")
    if player and class then
      -- Player Name should have been captured on login.
      if ui.PlayerName ~= player then
        ui.PlayerName  = player
      end
      ui.ActiveClass = class
    end

    -- Alignment
    local align = line:match("Align%s+:%s+(%w+)%s+%|$")
    if align then
      ui.alignment = align
    end

    -- Primary/Secondary class
    local pclass, sclass = line:match("Cls%s+:%s+([%w%-]+)%s*,?%s*([%w%-]*)%s*%|$")
    if pclass then
      ui.PClass = pclass
      ui.SecClass = (sclass ~= "" and sclass) or nil
    end

    -- Primary/Secondary subclass
    local psub, ssub = line:match("Sub%s+:%s+([%w%-]+)%s*,?%s*([%w%-]*)%s*%|$")
    if psub then
      ui.PSubclass = psub
      ui.SecSubclass = (ssub ~= "" and ssub) or nil
    end

    -- Active class level (Tnl / Level)
    local tnl, lvl = line:match("Tnl%s+:%s+(%d+)%s+%(%s*L%.(%d+)%)")
    if tnl and lvl then
      ui.ActiveClassLevel = tonumber(lvl)
      ui.Tnl = tonumber(tnl)
    end
  end
end


function GetClasses()
  enableTrigger("ScoreCaptureStart")
  --send("score", false)
  SilentScoreCapture()
end


-- Reapply the prompt colors for "pray gods"
function setPrayGodsColors()
  -- [>pray gods<]
  local t = "<ansi_cyan>[<cyan>><ghost_white>pr<ansi_white>a<dim_gray>y g<ansi_white>o<ghost_white>ds<cyan><<ansi_cyan>]"
  return t
end