-- Function to redraw status console UI(s)

function UpdateStatus (event, LVL, FLV, NXP, GLD, QPS, HPS, MDP, QTM, ETM, GTM, JTM, XPE, QPE, QTE, PLT)
----------------------------------------------------------------------
-- Get Status data
----------------------------------------------------------------------

  -- Get player classes
  if not ui.StartUp then
    if (ui.PlayerName == "") or 
       (ui.PClass == "") or 
       (ui.ActiveClass == "") or 
       (ui.ActiveClassLevel == "") then
      GetClasses()
    end
  end
  
  -- Correct names (SCORE cuts off at 10 characters)
  -- TODO: correct any word more than 10 characters
  --[[
  1234567890
  Telekineti c
  BoneCollec tor
  Planewalke r
  Necromance r
  Elementali st
  Illusionis t
  ]]
  
  if ui.SecSubclass == "Beastmaste" then
    ui.SecSubclass = "Beastmaster"
  end
  if ui.SecSubclass == "Telekineti" then
    ui.SecSubclass = "Telekinetic"
  end
  if ui.SecSubclass == "BoneCollec" then
    ui.SecSubclass = "BoneCollector"
  end
  if ui.SecSubclass == "Planewalke" then
    ui.SecSubclass = "Planewalker"
  end
  if ui.SecSubclass == "Necromance" then
    ui.SecSubclass = "Necromancer"
  end
  if ui.SecSubclass == "Elementali" then
    ui.SecSubclass = "Elementalist"
  end
  if ui.SecSubclass == "Illusionis" then
    ui.SecSubclass = "Illusionist"
  end
    
  -- Set active class and levels
  local act = "<red>(A)<sky_blue>"
  local active = ui.ActiveClass
  local aclvl  = ui.ActiveClassLevel
  local level  = ""
  local pclass = ui.PClass
  local psub   = ui.PSubclass
  local sclass = ui.SecClass
  local ssub   = ui.SecSubclass
  
  if pclass == active then pclass = pclass..act end
  if psub == active then psub = psub..act end
  if sclass == active then sclass = sclass..act end
  if ssub == active then ssub = ssub..act end

  -- Update level values
  if tonumber(LVL) == tonumber(aclvl) then
    level = LVL.."  <grey>Faux: <dark_orange>"..FLV
  else
    level = LVL.." <red>("..aclvl..")  <grey>Faux: <dark_orange>"..FLV
  end


  -- Display quest bonus time (timer created by the trigger: Quests/Quest bonus timer)
  local questBonusTime = nil
  ui.questBonusTimer = ui.questBonusTimer or "0"
  if ui.questBonusTimer ~= "0" then
    questBonusTime = " <yellow>("..round(remainingTime(ui.questBonusTimer,0))..")"
  else
    questBonusTime = ""
  end
  
  -- Set the correct EXP multipler status
  local XpEvent = "2X XP:"  -- Set a default
  if ui.Exp2k then XpEvent = "2x XP:" end
  if ui.Exp4k then XpEvent = "4x XP:" end
  

----------------------------------------------------------------------
-- Update Status
----------------------------------------------------------------------
  clearWindow("ui.PlayerInfoMC")
  cecho("ui.PlayerInfoMC", "<grey><b>Character Status</b>\n")
  hecho("ui.PlayerInfoMC", "#9f8e3d#b------------------------------------\n")
  cecho("ui.PlayerInfoMC", "<grey> Name: <white>"..ui.PlayerName.."\n")
  cecho("ui.PlayerInfoMC", "<grey>Class: <sky_blue>"..pclass..", "..psub.."\n")
  cecho("ui.PlayerInfoMC", "<grey>       <sky_blue>"..sclass..", "..ssub.."\n")
  cecho("ui.PlayerInfoMC", "\n")
  cecho("ui.PlayerInfoMC", "<grey>Level: <orange>"..level.."\n")
  cecho("ui.PlayerInfoMC", "<grey>  TNL: <turquoise>"..commaValue(NXP).."\n")
  cecho("ui.PlayerInfoMC", "<grey> Gold: <gold>"..commaValue(GLD).."\n")
  cecho("ui.PlayerInfoMC", "<grey> QPts: <medium_purple>"..commaValue(QPS).."\n")
  cecho("ui.PlayerInfoMC", "<grey> HPts: <lime_green>"..commaValue(HPS).."\n")
  cecho("ui.PlayerInfoMC", "<grey>MPies: <tan>"..commaValue(MDP).."\n")
  cecho("ui.PlayerInfoMC", "\n")
  cecho("ui.PlayerInfoMC", "<grey><b>Timers</b>\n")
  hecho("ui.PlayerInfoMC", "#9f8e3d#b------------------------------------\n")
  if QTM == "" then cecho("ui.PlayerInfoMC", "<grey>Quest:<cyan>         Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Quest: <white>        "..QTM..questBonusTime.."\n") end
  if ETM == "" then cecho("ui.PlayerInfoMC", "<grey>Expedition:    <cyan>Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Expedition:<white>    "..ETM.."\n") end
  if JTM == "" then cecho("ui.PlayerInfoMC", "<grey>Junkyard:<cyan>      Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Junkyard:<white>      "..JTM.."\n") end
  if PLT == "" then cecho("ui.PlayerInfoMC", "<grey>Pilgrimage:<cyan>    Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Pilgrimage:<white>      "..PLT.."\n") end
  if GTM == "" then cecho("ui.PlayerInfoMC", "<grey>GlobalQuest:<cyan>   Inactive!\n")
  else cecho("ui.PlayerInfoMC", "<grey>GlobalQuest:<white>   "..GTM.."\n") end
  cecho("ui.PlayerInfoMC", "\n")
  cecho("ui.PlayerInfoMC", "<grey><b>Events</b>\n")
  hecho("ui.PlayerInfoMC", "#9f8e3d#b------------------------------------\n")
  
  if (XPE ~= "" or nil) or (QPE ~= "" or nil) or (QTE ~= "" or nil) then

    if (XPE ~= "") then
      cecho("ui.PlayerInfoMC", "<black:gold><b>     "..XpEvent.."<black:gold>        "..XPE.."     </b>\n")
    end
     
    if (QPE ~= "") then
      cecho("ui.PlayerInfoMC", "<grey>2x QP:<white>        "..QPE.."\n")
    end
     
    if (QTE ~= "") then
      cecho("ui.PlayerInfoMC", "<white:dark_green><b> No Quest Timer: "..QTE.."</b> \n")
    end

  elseif ui.CurrentEvent then
    cecho("ui.PlayerInfoMC", "<white:dark_green> Current Event: <b>"..ui.CurrentEvent.."</b> \n")
     
  else
      cecho("ui.PlayerInfoMC", "<grey>No Events Active.\n")
  end
    
  -- Sprites
  if ui.SpriteType then
    if ui.SpriteType == "Sunsurge" then ui.SpriteType = "<yellow>"..ui.SpriteType end
    if ui.SpriteType == "Lifestream" then ui.SpriteType = "<cyan>"..ui.SpriteType end
    if ui.SpriteType == "Earthguard" then ui.SpriteType = "<green>"..ui.SpriteType end
    if ui.SpriteType == "Windstrike" then ui.SpriteType = "<sky_blue>"..ui.SpriteType end
    cecho("ui.PlayerInfoMC", "\n")
    cecho("ui.PlayerInfoMC", ui.SpriteType.."<white> sprite! ~<gold>"..ui.SpriteTimer.."m")
    cecho("ui.PlayerInfoMC", "\n<white> ^-<gold>"..ui.SpriteLocation.."<white>-^<reset>")
  end
   
end

registerAnonymousEventHandler("UI_UpdateStatus", "UpdateStatus")