  -- Trigger: CopyToBuffer
  -- Pattern (regex): ^
  -- Description: Copies every single line to the MainBuffer.
  
  selectCurrentLine()
  copy()
  appendBuffer("MainBuffer")
  