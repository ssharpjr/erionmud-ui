-- Erion Minimal Black Theme

ui = ui or {}

function ThemeMinimalBlack()
  ui.BorderColor = "black"
  ui.BgColor = "black"
  ui.BgColorRGB = {0,0,0}
  ui.LockStyle = "full"  -- Hides all borders. The container must be unlocked with a command.
  ui.MainStyleSheet = [[
      background: ]] .. ui.BgColor .. [[ ;
      border: 0px solid ]] .. ui.BorderColor .. [[ ;
      border-radius: 10px;
    ]]
end
