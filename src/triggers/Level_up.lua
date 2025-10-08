-- Trigger: Level up
-- Pattern (regex): ^You are now a level (\d+) (\w+)\!\!$
-- Pattern (regex): ^You raise a faux level
-- Description: Update stuff when you level (a placeholder for things to come)

selectCurrentLine()
setBgColor(0,80,0)

tempTimer(5, function() GetClasses() end)