ui = ui or {}

ui.questBonusTimerMin = matches.min
ui.questBonusTimerSec = matches.sec or 0
ui.questBonusTimerTotal = ((matches.min * 60) + matches.sec)


-- Creates a timer that is used by the UI.
if (ui.questBonusTimer == "0") or (ui.questBonusTimer == nil) then
  -- Don't create multiple timers
  ui.questBonusTimer = tempTimer(ui.questBonusTimerTotal, function() ui.questBonusTimer = "0" end)
end
