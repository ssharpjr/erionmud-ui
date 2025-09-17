-- Trigger: Junkyard rewards
-- Pattern (regex): ^(.*) says to you\, \'Your reward is (?<exp>\d+) experience and (?<gold>\d+) gold\!\'$

ui = ui or {}

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