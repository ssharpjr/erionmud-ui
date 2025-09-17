-- Function to redraw status console UI(s)

function UpdateStatus (event, LVL, FLV, NXP, GLD, QPS, HPS, MDP, QTM, ETM, GTM, JTM, XPE, QPE, QTE, PLT, GJY)
----------------------------------------------------------------------
-- Get Status data
----------------------------------------------------------------------

  -- Get player classes if needed
  if not ui.StartUp then
    if (ui.PlayerName == "") or (ui.PlayerName == nil) or
       (ui.PClass == "") or (ui.PClass == nil) or 
       (ui.ActiveClass == "") or (ui.ActiveClass == nil) or 
       (ui.ActiveClassLevel == "") or (ui.ActiveClassLevel == nil) then
      GetClasses()
    end
  end
  
  -- Complete 2nd Class Subclass names (SCORE cuts off at 18 total characters) 
  -- Ignore redundancies :) 
  if ui.SecSubclass then
    -- Mage
    if string.find(ui.SecSubclass, "Eleme", 1) then
      ui.SecSubclass = "Elementalist"
    end
    if string.find(ui.SecSubclass, "Battl", 1) then
      ui.SecSubclass = "BattleMage"
    end
    if string.find(ui.SecSubclass, "Plane", 1) then
      ui.SecSubclass = "Planewalker"
    end
    
    -- Cleric
    if string.find(ui.SecSubclass, "Preis", 1) then
      ui.SecSubclass = "Priest"
    end
    if string.find(ui.SecSubclass, "Shama", 1) then
      ui.SecSubclass = "Shaman"
    end
    if string.find(ui.SecSubclass, "Venom", 1) then
      ui.SecSubclass = "Venomist"
    end
    
    -- Thief
    if string.find(ui.SecSubclass, "Ninja", 1) then
      ui.SecSubclass = "Ninja"
    end
    if string.find(ui.SecSubclass, "Assas", 1) then
      ui.SecSubclass = "Assassin"
    end
    if string.find(ui.SecSubclass, "Spy", 1) then
      ui.SecSubclass = "Spy"
    end
    
    -- Warrior
    if string.find(ui.SecSubclass, "Gladi", 1) then
      ui.SecSubclass = "Gladiator"
    end
    if string.find(ui.SecSubclass, "Merce", 1) then
      ui.SecSubclass = "Mercenary"
    end
    if string.find(ui.SecSubclass, "Barba", 1) then
      ui.SecSubclass = "Barbarian"
    end
    
    -- Gaian
    if string.find(ui.SecSubclass, "Druid", 1) then
      ui.SecSubclass = "Druid"
    end
    if string.find(ui.SecSubclass, "Sage", 1) then
      ui.SecSubclass = "Sage"
    end
    if string.find(ui.SecSubclass, "Herba", 1) then
      ui.SecSubclass = "Herbalist"
    end
    
    -- Psionist
    if string.find(ui.SecSubclass, "Psibl", 1) then
      ui.SecSubclass = "Psiblade"
    end
    if string.find(ui.SecSubclass, "Menta", 1) then
      ui.SecSubclass = "Mentalist"
    end
    if string.find(ui.SecSubclass, "Telek", 1) then
      ui.SecSubclass = "Telekinetic"
    end
    
    --Illusionist
    if string.find(ui.SecSubclass, "Charm", 1) then
      ui.SecSubclass = "Charmer"
    end
    if string.find(ui.SecSubclass, "Trick", 1) then
      ui.SecSubclass = "Trickster"
    end
    if string.find(ui.SecSubclass, "Mirag", 1) then
      ui.SecSubclass = "Mirage"
    end
    
    
    --Archer
    if string.find(ui.SecSubclass, "Snipe", 1) then
      ui.SecSubclass = "Sniper"
    end
    if string.find(ui.SecSubclass, "Beast", 1) then
      ui.SecSubclass = "Beastmaster"
    end
    if string.find(ui.SecSubclass, "Scout", 1) then
      ui.SecSubclass = "Scout"
    end
    
    -- Necromancer
    if string.find(ui.SecSubclass, "BoneC", 1) then
      ui.SecSubclass = "BoneCollector"
    end
    if string.find(ui.SecSubclass, "Voodo", 1) then
      ui.SecSubclass = "Voodooist"
    end
    if string.find(ui.SecSubclass, "Diabo", 1) then
      ui.SecSubclass = "Diabolist"
    end
    
    -- Witch
    if string.find(ui.SecSubclass, "Occul", 1) then
      ui.SecSubclass = "Occultist"
    end
    if string.find(ui.SecSubclass, "White", 1) then
      ui.SecSubclass = "WhiteWitch"
    end
    if string.find(ui.SecSubclass, "Dream", 1) then
      ui.SecSubclass = "DreamWitch"
    end
    
    -- Monk
    if string.find(ui.SecSubclass, "Disci", 1) then
      ui.SecSubclass = "Disciple"
    end
    if string.find(ui.SecSubclass, "Zealo", 1) then
      ui.SecSubclass = "Zealot"
    end
    if string.find(ui.SecSubclass, "Defen", 1) then
      ui.SecSubclass = "Defender"
    end
  end
  
  -- Set classes, active class, and levels
  local act = "<red>(A)<sky_blue>"
  local active = ui.ActiveClass or ""
  local aclvl  = ui.ActiveClassLevel or ""
  local level  = ""
  local pclass = ui.PClass or ""
  local psub   = ui.PSubclass or ""
  local sclass = ui.SecClass or ""
  local ssub   = ui.SecSubclass or ""

  -- Don't show the "(A)" if the character only has 1 class
  if pclass == active and (psub ~= "None" or sclass ~= "") then
    pclass = pclass..act
  end
  -- if pclass == active then pclass = pclass..act end
  if psub == active then psub = psub..act end
  if sclass == active then sclass = sclass..act end
  if ssub == active then ssub = ssub..act end

  -- Debug
  -- cecho("\n<orange_red>DEBUG: active: "..active.."\n")
  -- cecho("<orange_red>DEBUG: pclass: "..pclass.."\n")
  -- cecho("<orange_red>DEBUG: psub: "..psub.."\n")
  -- cecho("<orange_red>DEBUG: sclass: "..sclass.."\n")

  -- Update level values
  FLV = tonumber(FLV) or 0
  if tonumber(LVL) == tonumber(aclvl) then
    if FLV == 0 then
      level = LVL
    else
      level = LVL.."  <grey>Faux: <dark_orange>"..FLV
    end
  else
    if FLV == 0 then
      level = LVL.." <red>("..aclvl
    else
      level = LVL.." <red>("..aclvl..")  <grey>Faux: <dark_orange>"..FLV
    end
  end

  -- Display quest bonus time (timer created by the trigger: Quests/Quest bonus timer)
  local questBonusTime = nil
  ui.questBonusTimer = ui.questBonusTimer or "0"
  if ui.questBonusTimer ~= "0" then
    questBonusTime = " <yellow>("..round(remainingTime(ui.questBonusTimer,0))..")"
  else
    questBonusTime = ""
  end
  
  -- Display expedition bonus time (timer created by the trigger: 
  --  - Expeditions/Exped Target Capture/Expedition bonus timer)
  local expedBonusTime = nil
  ui.expedBonusTimer = ui.expedBonusTimer or "0"
  if ui.expedBonusTimer ~= "0" then
    expedBonusTime = " <yellow>("..round(remainingTime(ui.expedBonusTimer,0))..")"
  else
    expedBonusTime = ""
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
  
  -- Primary only or primary and subclass
  if psub == "None" then
    cecho("ui.PlayerInfoMC", "<grey>Class: <sky_blue>"..pclass.."\n")
  else
    cecho("ui.PlayerInfoMC", "<grey>Class: <sky_blue>"..pclass..", "..psub.."\n")
  end
  
  -- Secondary only or secondary and secondary subclass
  if sclass ~= "" and ssub ~= "" then
    cecho("ui.PlayerInfoMC", "<grey>      <sky_blue>"..sclass..", "..ssub.."\n")
  elseif sclass ~= "" then
    cecho("ui.PlayerInfoMC", "<grey>      <sky_blue>"..sclass.."\n")
  end
  
  
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
  else cecho("ui.PlayerInfoMC", "<grey>Expedition:<white>    "..ETM..expedBonusTime.."\n") end
  if JTM == "" then cecho("ui.PlayerInfoMC", "<grey>Junkyard:<cyan>      Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Junkyard:<white>      "..JTM.."\n") end
  if PLT == "" then cecho("ui.PlayerInfoMC", "<grey>Pilgrimage:<cyan>    Available!\n")
  else cecho("ui.PlayerInfoMC", "<grey>Pilgrimage:<white>      "..PLT.."\n") end
  if GTM == "" then cecho("ui.PlayerInfoMC", "<grey>GlobalQuest:<cyan>   Inactive!\n")
  else cecho("ui.PlayerInfoMC", "<grey>GlobalQuest:<white>   "..GTM.."\n") end
  if GTM == "" then cecho("ui.PlayerInfoMC", "<grey>GlobalJyard:<cyan>   Inactive!\n")
  else cecho("ui.PlayerInfoMC", "<grey>GlobalJyard:<white>   "..GJY.."\n") end
  cecho("ui.PlayerInfoMC", "\n")
  
  cecho("ui.PlayerInfoMC", "<grey><b>Events</b>\n")
  hecho("ui.PlayerInfoMC", "#9f8e3d#b------------------------------------\n")
  
  if (XPE ~= "" or nil) or (QPE ~= "" or nil) or (QTE ~= "" or nil) then

    if (XPE ~= "") then
      cecho("ui.PlayerInfoMC", "<black:gold><b>     "..XpEvent.."<black:gold>        "..XPE.."     </b>\n")
    end
     
    if (QPE ~= "") then
      cecho("ui.PlayerInfoMC", "<black:gold><b>     2x QP:        "..QPE.."     </b>\n")
    end
     
    if (QTE ~= "") then
      cecho("ui.PlayerInfoMC", "<white:dark_green><b> No Quest Timer: "..QTE.."</b> \n")
    end

  elseif ui.CurrentEvent then
    cecho("ui.PlayerInfoMC", "<white:dark_green> Event: <b>"..ui.CurrentEvent.."</b> \n")
     
  else
      cecho("ui.PlayerInfoMC", "<grey>No Events Active.\n")
  end
    
  -- Sprites
  -- if ui.SpriteType then
    -- if ui.SpriteType == "Sunsurge" then ui.SpriteType = "<yellow>"..ui.SpriteType end
    -- if ui.SpriteType == "Lifestream" then ui.SpriteType = "<cyan>"..ui.SpriteType end
    -- if ui.SpriteType == "Earthguard" then ui.SpriteType = "<green>"..ui.SpriteType end
    -- if ui.SpriteType == "Windstrike" then ui.SpriteType = "<sky_blue>"..ui.SpriteType end
    -- cecho("ui.PlayerInfoMC", "\n")
    -- cecho("ui.PlayerInfoMC", ui.SpriteType.."<white> sprite! ~<gold>"..ui.SpriteTimer.."m")
    -- cecho("ui.PlayerInfoMC", "\n<white> ^-<gold>"..ui.SpriteLocation.."<white>-^<reset>")
  -- end
   
end

registerAnonymousEventHandler("UI_UpdateStatus", "UpdateStatus")