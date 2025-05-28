ui = ui or {}

ui.expedBonusTimerMin = matches.min
ui.expedBonusTimerSec = matches.sec or 0
ui.expedBonusTimerTotal = ((matches.min * 60) + matches.sec)
ui.expedBonusTimer = tempTimer(ui.expedBonusTimerTotal, function() ui.expedBonusTimer = "0" end)