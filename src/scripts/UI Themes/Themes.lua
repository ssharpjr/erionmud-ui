-- Themes
-- If you want to add more themes, please following this process:
-- - Create a new "Scripts/UI Themes/Theme..." script with your CSS.
-- - Add your theme name and abbreviation to the comment list below.
-- - Add your theme to the SetTheme() function below.

--[[

"Erion Green", "er"   - This is the default theme. It's based on the colors from the erionmud.com website.
"Minimal Black", "mb" - This is close to the original minimal theme by Caelinus.

]]

ui = ui or {}

function ShowThemes()
  -- List available themes
  uiCecho("<cyan>Available UI Themes\n")
  uiCecho("<green>Erion Green    <yellow>[ <cyan>uitheme er <yellow>]\n")
  uiCecho("<green>Minimal Black  <yellow>[ <cyan>uitheme mb <yellow>]\n")
  echo("\n")
end


function SetTheme(theme)
  -- Set the theme requested by "Aliases/Set UI Theme"
  if theme == "er" then
    ui.CurrentTheme = "er"
    ui.CurrentThemeName = "Erion Green"
    ui.SettingsDB["theme"] = ui.CurrentTheme
    ui.SettingsDB["theme_name"] = ui.CurrentThemeName
    SaveUISettings()
    ThemeErionGreen()
    InitUI()
    send(" ")
    uiCecho("Theme set to: <green>Erion Green")
  elseif theme == "mb" then
    ui.CurrentTheme = "mb"
    ui.CurrentThemeName = "Minimal Black"
    ui.SettingsDB["theme"] = ui.CurrentTheme
    ui.SettingsDB["theme_name"] = ui.CurrentThemeName
    SaveUISettings()
    ThemeMinimalBlack()
    InitUI()
    send(" ")
    uiCecho("Theme set to: <green>Minimal Black")
  else
    -- Back to the default
    ui.CurrentTheme = "er"
    ui.SettingsDB["theme"] = ui.CurrentTheme
    --cecho("\n<orange_red>Theme not recognized.")
    --ShowThemes()
  end

end