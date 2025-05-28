-- Name: Expedition bonus timer
-- Pattern:
--  (regex): ^Finish the expedition in under (?<min>\d+) minutes and (?<sec>\d+) seconds for a bonus reward
--  (regex): ^Finish the expedition in under (?<min>\d+) minutes for a bonus reward
-- Description: Create an expedition bonus timer.

ui = ui or {}

ui.expedBonusTimerMin = matches.min
ui.expedBonusTimerSec = matches.sec or 0
ui.expedBonusTimerTotal = ((matches.min * 60) + matches.sec)
ui.expedBonusTimer = tempTimer(ui.expedBonusTimerTotal, function() ui.expedBonusTimer = "0" end)