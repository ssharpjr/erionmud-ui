-- Social verbs to capture
local verbset = {
  ask=true, asks=true,
  say=true, says=true,
  chuckle=true, chuckles=true, 
  exclaim=true, exclaims=true,
  yell=true, yells=true,
}

local function has_verb(text)
  local v = tostring(text or ""):lower()
  return verbset[v] or false
end

-- Capture and process chat text.
function ChatCaptures(verb, bDeleteLine)
  local bDeleteLine = bDeleteLine or false
  
  selectCurrentLine()
  setBgColor(unpack(ui.BgColorRGB))
  
  -- Set some custom colors
  if has_verb(matches.verb) then
    setFgColor(255,170,255)  -- peachy?
  end
  
  if matches[1] == "[mudlet]" then
    setFgColor(255,170,0)  -- orange
  end
  
  if matches[1] == "[secrets]" then
    setFgColor(170, 85, 255)  -- purple
  end
  
  if matches[1] == "(Gtell):" then
    setFgColor(255,0,255)  -- magenta
  end
  
  copy()
  setBgColor(0,0,0)  -- Reset background color to black
  
  -- Remove this line from the main window if toggled.
  if not bDeleteLine then deleteLine() end
  
  moveCursorEnd("MainBuffer")
  selectCurrentLine("MainBuffer")
  deleteLine("MainBuffer")
  
  moveCursorUp(2)
  --selectCurrentLine()
  
  for i = 1, 3, 1 do
    if getCurrentLine() == "" then
      --debugc("Deleted: "..getCurrentLine())
      deleteLine()
    end
    moveCursorDown()
    selectCurrentLine()
  end
  
  appendBuffer("ui.ChatMC")
  appendBuffer("ChatBuffer")
end