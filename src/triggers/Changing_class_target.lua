-- Trigger: Changing class target
-- Pattern (regex): ^You are now targeting the (?<class>\w+) class
-- Pattern (regex): ^You are now targeting the (?<class>\w+) subclass
-- Pattern (regex): ^Congratulations\! You have added the (?<class>.*) subclass\!
-- Description: Update the active class when "class target" is used

ui = ui or {}

ui.ActiveClass = matches.class
GetClasses()
UpdateStatus()