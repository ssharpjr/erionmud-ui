-- Alias: Quit
-- Pattern: ^(quit|qquit)$
-- Description: Intercept the "quit" command so we can run some commands before quitting.

ui = ui or {}

-- Reset the prompt on quit
uiCecho("Resetting Prompt to ALL\n")
send("prompt all", false)

if matches[2] == "qquit" then
  -- Quick Quit (quits to character menu then quits the game).
  send("quit;;q", false)
else
  send("quit", false)
end