function uiHelpTechnical()
  cecho("\n<yellow>======================================================================")
  cecho("\n<green>"..centerText("ErionMud UI Technical Notes"))
  cecho("\n<yellow>======================================================================")
  echo("\n")
  cecho("\n<yellow>ErionMud does not fully support MSDP or GMCP.")
  cecho("\n<yellow>All data is processed using text triggers.")
  echo("\n")
  cecho("\n<yellow>Nothing really here yet. Check the comments in the scripts for now.")
  echo("\n")
  cecho("\n<yellow>======================================================================\n")
end


-- Technical Notes

--[[
# Triggers

## ScoreCaptures 

CaptureActiveClass - captures the current character name and class
CaptureClass - captures the primary and secondary classes
CaptureSubclass - captures the primary and secondary subclasses
CaptureActiveClassLevel - captures the active class level


]]