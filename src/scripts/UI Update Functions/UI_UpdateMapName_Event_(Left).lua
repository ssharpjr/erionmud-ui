--Update the map information panel

function UpdateMapName (event, RNM, ANM, RMS, VNM)
  clearWindow("ui.AnsiMapNameMC")
  
  cecho("ui.AnsiMapNameMC", "<b>Area Map</b>\n")
  hecho("ui.AnsiMapNameMC", "#9f8e3d#b---------------------------------\n")
  cecho("ui.AnsiMapNameMC", "<grey>Area: <royal_blue>"..ANM.."\n")
  cecho("ui.AnsiMapNameMC", "<grey>Room: <royal_blue>"..RNM.."\n")
  cecho("ui.AnsiMapNameMC", "<grey>Sector: <royal_blue>"..RMS.."\n")
  cecho("ui.AnsiMapNameMC", "<grey>VNUM: <royal_blue>"..VNM)
  

end

registerAnonymousEventHandler("UI_UpdateMapName", "UpdateMapName")