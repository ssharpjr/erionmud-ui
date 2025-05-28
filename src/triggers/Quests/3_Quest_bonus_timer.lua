ui = ui or {}

ui.questBonusTimerMin = matches.min
ui.questBonusTimerSec = matches.sec or 0
ui.questBonusTimerTotal = ((matches.min * 60) + matches.sec)
ui.questBonusTimer = tempTimer(ui.questBonusTimerTotal, function() ui.questBonusTimer = "0" end)