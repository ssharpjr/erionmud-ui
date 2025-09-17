-- Set in-game toggles for the UI
-- Use "PROMPT DEFAULT" to reset your prompt to default. 
--   This is useful if you are playing without this UI package.
function SetMudSettings()
  send("toggle +tick", false)
  send("toggle +compact", false)
  send("toggle +map", false)
  send("prompt #1%h#2%H#3%m#4%M#5%p#6%T#7%x#8%X#9%g#10%C#11%u#12%r#13%e#14%L#15%I#16%n#17%B#18%S#19%R#20%f#21%F#22%J#23%j#24%G#25%k#26%K#27%N#28%P#29%Z#30%V#", false)
end

registerAnonymousEventHandler("SetDefaultMudSettings", "SetMudSettings")