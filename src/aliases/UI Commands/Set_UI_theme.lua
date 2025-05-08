-- Name: Set UI theme
-- Pattern: ^uitheme\s?(?<theme>\w+)?
-- Description: Set the UI theme

local theme = matches.theme

if string.len(theme) == 0 then
  --uiCecho("<orange_red>Usage: uitheme THEME\n\n")
  uiCecho("Current theme: <green>"..ui.CurrentThemeName.."\n\n")
  ShowThemes()
else
  --uiCecho("<orange_red>theme: "..theme.."\n\n")
  SetTheme(theme)
end