-- Function to redraw Bottom Status Console UI

function UpdatePrompt (event, CHP, MHP, CMP, MMP, THP, TNM, LMP, PRE, PHP)
  clearWindow("ui.StatusMC")

  -- Convert digit strings to numbers
  CHP = tonumber(CHP) or 0
  MHP = tonumber(MHP) or 0
  CMP = tonumber(CMP) or 0
  MMP = tonumber(MMP) or 0
  LMP = tonumber(LMP) or 0


  -- Colorize pet HP
  local php = ColorizePetHP()
  

  --Prompt Line 1
  cecho("ui.StatusMC","               == [HP: ")
  if (CHP/MHP) >= 0.66 then 
    cecho("ui.StatusMC","<green>"..CHP.."<grey>/")
  elseif (CHP/MHP) >= 0.33 then 
    cecho("ui.StatusMC","<yellow>"..CHP.."<grey>/") 
  else
    cecho("ui.StatusMC","<red>"..CHP.."<grey>/")
  end
  cecho("ui.StatusMC","<green>"..MHP.."<grey>] [MP: ")
  
  if (CMP/MMP) >= 0.66 then
    cecho("ui.StatusMC","<cyan>"..CMP.."<grey>/")
  elseif (CMP/MMP) >= 0.33 then
    cecho("ui.StatusMC","<yellow>"..CMP.."<grey>/")
  else
    cecho("ui.StatusMC","<red>"..CMP.."<grey>/")
  end
  cecho("ui.StatusMC","<cyan>"..MMP.."<grey>] [Limit: ")

  if (LMP ~= "100" or " 100") then
    cecho("ui.StatusMC", "<purple>"..LMP.."%<grey>]")
  else
    cecho("ui.StatusMC", "<purple>READY!<grey>]")
  end
  if PRE ~= "" then
    CPRE = ansi2string(PRE)
    cecho("ui.StatusMC", " <red>"..PRE.." <grey>==\n")
  else
    cecho("ui.StatusMC", " <grey>== \n")
  end
  
  -- Prompt Line 2
  if (TNM == "") then
    cecho("ui.StatusMC", "<grey>               == [Target: <white>None<grey>] ")
  else
    CTNM = ansi2string(TNM)
    CTHP = ansi2string(THP)
    cecho("ui.StatusMC", "<grey>               == [Target: <white>")
    cecho("ui.StatusMC", "<white>"..CTNM.."<grey> (HP: <red>"..CTHP.."<grey>) ] ")
  end
  
  if PHP == "" then
    cecho("ui.StatusMC", "<grey>==\n")
  else
  
    -- Prompt Line 3    
    cecho("ui.StatusMC", "<grey>==")
    cecho("ui.StatusMC","\n<grey>               == ")
    cecho("ui.StatusMC", "<grey>[Pets: ")
    cecho("ui.StatusMC", "<white>"..php.."<grey>] ==\n")
  end
  
  hp = tonumber(CHP)
  hp_max = tonumber(MHP)
  hp_dec = (hp/hp_max)*100
  hp_per = round(hp_dec, 0)
  hpbar:setValue(hp,hp_max)
  hpbar:setText("HP: "..hp_per.."%")
  
  mp = tonumber(CMP)
  mp_max = tonumber(MMP)
  mp_dec = (mp/mp_max)*100
  mp_per = round(mp_dec, 0)
  enbar:setValue(mp,mp_max)
  enbar:setText("MP: "..mp_per.."%")
  
  
  
end

registerAnonymousEventHandler("UI_UpdatePrompt", "UpdatePrompt")