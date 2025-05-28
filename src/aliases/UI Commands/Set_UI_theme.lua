-- Name: Set UI theme
-- Pattern: ^uitheme\s?(?<theme>\w+)?
-- Description: Set the UI theme

ui = ui or {}

local theme = matches.theme

if string.len(theme) == 0 then
  uiCecho("Current theme: <green>"..ui.CurrentThemeName.."\n\n")
  ShowThemes()
else
  SetTheme(theme)
end