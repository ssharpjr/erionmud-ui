ui = ui or {}

-- Build the initial layout
function BuildLayout()
  -- Calculate container widths
  -- The left container will use 15% of the total screen
  -- The right container will use 25% of the total screen
  -- These can be adjusted as desired once the containers are unlocked.
  
  ui.containerPadding = {
    base   = 5,
    left   = 5,
    top    = 10,
    right  = 10
  }
  
  ui.mw, ui.mh = getMainWindowSize()
  ui.mcw = getMainConsoleWidth()
  ui.LeftContainerWidth = (ui.mw * 0.15)  -- 15% of the screen
  ui.RightContainerWidth = (ui.mw * 0.30)  -- 30% of the screen
  ui.TopContainerWidth = (ui.mw - (ui.LeftContainerWidth + ui.RightContainerWidth))
  ui.BottomContainerWidth = ui.TopContainerWidth
  ui.TopContainerHeight = 120  -- This is static to hold the needed information
  ui.BottomContainerHeight = 80 -- This is static to hold the needed information
  ui.CmdLineStart = ui.LeftContainerWidth + 10  -- Adjust this offset accordingly
  ui.AnsiMapWidth = 140  -- This is static so the complete map is displayed
  ui.AnsiMapLeftMargin = ((ui.LeftContainerWidth/2) - (ui.AnsiMapWidth/2))  -- Ratio to keep it centered
end