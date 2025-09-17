-- Trigger: Quest rewards
-- Pattern (regex): ^(?<text>.*) As a reward\, I am giving you (?<exp>\d+) experience and (?<gold>\d+) gold\.\'$
-- Pattern (regex): ^(?<text>.*) As a reward\, I am giving you (?<qps>\d+) questpoints and (?<gold>\d+) gold\.\'$
-- Description: Show rewards

if matches.exp then
  echo("\n\n")
  uiCecho("<gold>**************\n")
  uiCecho("<green>  EXP: " .. commaValue((tonumber(matches.exp))).."\n")
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))).."\n")
  uiCecho("<gold>**************\n\n")
end

if matches.qps then
  echo("\n\n")
  uiCecho("<gold>**************\n")
  uiCecho("<green>  QPs: " .. commaValue((tonumber(matches.qps))).."\n")
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))).."\n")
  uiCecho("<gold>**************\n\n")
end