-- Erion Green Theme

ui = ui or {}

function ThemeErionGreen()
  ui.BorderColor = "#9f8e3d"  -- Erion Gold
  ui.BgColor = "#0c1510"      -- Erion Green
  ui.BgColorRGB = {12,21,16}  -- Erion Green in RGB (unpack(table))
  ui.LockStyle = "full"  -- Hides all borders. The container must be unlocked with a command.
  ui.MainStyleSheet = [[
      background: ]] .. ui.BgColor .. [[ ;
      border: 3px solid ]] .. ui.BorderColor .. [[ ;
      border-radius: 10px;
    ]]
end
