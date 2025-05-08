if matches.exp then
  uiCecho("<gold>**************")
  uiCecho("<green>  EXP: " .. commaValue((tonumber(matches.exp))))
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))))
  uiCecho("<gold>**************\n\n")
end

if matches.qps then
  uiCecho("<gold>**************")
  uiCecho("<green>  QPs: " .. commaValue((tonumber(matches.qps))))
  uiCecho("<yellow> Gold: " .. commaValue((tonumber(matches.gold))))
  uiCecho("<gold>**************\n\n")
end