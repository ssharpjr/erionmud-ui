-- Trigger: Quest rewards
-- Pattern (regex): ^(?<text>.*) As a reward\, I am giving you (?<exp>\d+) experience and (?<gold>\d+) gold\.\'$
-- Pattern (regex): ^(?<text>.*) As a reward\, I am giving you (?<qps>\d+) questpoints and (?<gold>\d+) gold\.\'$
-- Description: Show rewards

if matches.exp then
  echo("\n\n")
  uiCecho("<gold>**************")
  uiCecho("<green>  EXP: " .. commaValue((tonumber(matches.exp))))
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))))
  uiCecho("<gold>**************")
end

if matches.qps then
  echo("\n\n")
  uiCecho("<gold>**************")
  uiCecho("<green>  QPs: " .. commaValue((tonumber(matches.qps))))
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))))
  uiCecho("<gold>**************")
end