-- Function to redraw Bottom Status Console UI (nil- and sanity-safe)
function UpdatePrompt(event, CHP, MHP, CMP, MMP, THP, TNM, LMP, PRE, PHP)
  -- Clear UI
  clearWindow("ui.StatusMC")

  -- Debug: print all inputs
  -- cecho("\n<orange_red>DEBUG UpdatePrompt inputs:\n")
  -- cecho("<orange_red>CHP: "..tostring(CHP)..", MHP: "..tostring(MHP)..", CMP: "..tostring(CMP)..", MMP: "..tostring(MMP).."\n")
  -- cecho("<orange_red>THP: "..tostring(THP)..", TNM: "..tostring(TNM)..", PHP: "..tostring(PHP).."\n")
  -- cecho("<orange_red>LMP: "..tostring(LMP)..", PRE: "..tostring(PRE)..", ui.lowestPetHP: "..tostring(ui.lowestPetHP).."\n")

  -- Convert digit strings to numbers safely
  CHP = safe_number(CHP, 0)
  MHP = safe_number(MHP, 1)  -- prevent divide by zero
  CMP = safe_number(CMP, 0)
  MMP = safe_number(MMP, 1)
  LMP = safe_number(LMP, 0)
  PRE = safe_string(PRE, "")
  PHP = safe_string(PHP, "")
  
  -- Colorize pet HP safely
  local php = safe_string(ColorizePetHP(), "None")

  -- Damage calculators
  local myDamage      = safe_number(gp.myDamageGiven, 0)
  local myComboDamage = safe_number(gp.myComboDamage, 0)
  local specDamage    = safe_number(gp.specDamage, 0)
  local petDamage     = safe_number(gp.currentTotalPetFightDamage, 0)
  local currentDamage = safe_number(gp.currentFightDamage, 0)
  local lastDamage    = safe_number(gp.lastFightTotalDamage, 0)

  -- Prompt Line 1: HP / MP / Limit
  cecho("ui.StatusMC", "               == [HP: ")
  local hp_frac = safe_div(CHP, MHP)
  if hp_frac >= 0.66 then cecho("ui.StatusMC", "<green>"..CHP.."<grey>/")
  elseif hp_frac >= 0.33 then cecho("ui.StatusMC", "<yellow>"..CHP.."<grey>/")
  else cecho("ui.StatusMC", "<red>"..CHP.."<grey>/") end
  cecho("ui.StatusMC", "<green>"..MHP.."<grey>] [MP: ")

  local mp_frac = safe_div(CMP, MMP)
  if mp_frac >= 0.66 then cecho("ui.StatusMC", "<cyan>"..CMP.."<grey>/")
  elseif mp_frac >= 0.33 then cecho("ui.StatusMC", "<yellow>"..CMP.."<grey>/")
  else cecho("ui.StatusMC", "<red>"..CMP.."<grey>/") end
  cecho("ui.StatusMC", "<cyan>"..MMP.."<grey>] [Limit: ")

  if LMP >= 100 then
    cecho("ui.StatusMC", "<purple>READY!<grey>]")
  else
    cecho("ui.StatusMC", "<purple>"..LMP.."%<grey>]")
  end

  -- Prompt Line 1 extra info (PRE or damage)
  if PRE ~= "" then
    local pre = trim(PRE)
    local cpre = ansi2string(pre)
    if pre == trim("[>pray gods<]") then
      local cpre = setPrayGodsColors(cpre)
      cecho("ui.StatusMC", cpre.." <grey>==\n")
    else
      cecho("ui.StatusMC", " <red>"..cpre.." <grey>==\n")
    end
  else
    -- Damage
    if specDamage ~= 0 and lastDamage ~= 0 then
      cecho("ui.StatusMC", " <grey>[Last Fight Dmg/Sp: <green>"..commaValue(lastDamage).."<grey>/<orange>"..commaValue(specDamage).."<grey>]")
    elseif lastDamage ~= 0 then
      cecho("ui.StatusMC", " <grey>[Last Fight Dmg: <green>"..commaValue(lastDamage).."<grey>]")
    elseif currentDamage ~= 0 then
      cecho("ui.StatusMC", " <grey>[Fight Dmg: <yellow>"..commaValue(currentDamage).."<grey>]")
    end
    cecho("ui.StatusMC", " <grey>== \n")
  end

  -- Prompt Line 2: Target info
  local CTNM = ansi2string(TNM)
  local CTHP = THP
  if TNM == "" then
    cecho("ui.StatusMC", "<grey>               == [Target: <white>None<grey>] ")
  else
    cecho("ui.StatusMC", "<grey>               == [Target: <white>"..CTNM.."<grey> (HP: <red>"..CTHP.."<grey>) ] ")
    if myDamage ~= 0 then
      cecho("ui.StatusMC", " <grey>[My Dmg: <yellow>"..commaValue(myDamage).."<grey>] ")
    end
  end

  -- Prompt Line 3: Pets
  local pethp = ui.lowestPetHP
  if not pethp or type(pethp) ~= "number" or pethp ~= pethp or pethp == math.huge then
      pethp = 0
  end
  if PHP ~= "" and pethp > 0 then  -- No pets, no damage display.
    cecho("ui.StatusMC", "<grey>==\n               == <grey>[Pets: <white>"..php.."<grey>]")
    if petDamage ~= 0 then
      cecho("ui.StatusMC", " <grey>[Pet Dmg: <yellow>"..commaValue(petDamage).."] ")
    end
    cecho("ui.StatusMC", "<grey> ==\n")
  else
    cecho("ui.StatusMC", "<grey>==\n")
  end

  -- HP Bar
  local hp_per = round(safe_div(CHP, MHP)*100, 0)
  hpbar:setValue(CHP, MHP)
  hpbar:setText("HP: "..hp_per.."%")

  -- MP/EN Bar
  local mp_per = round(safe_div(CMP, MMP)*100, 0)
  enbar:setValue(CMP, MMP)
  enbar:setText("MP: "..mp_per.."%")

  -- Pet HP Bar (fully sanitized)
  local pethp_max = 100
  local pethp_per = round(safe_div(pethp, pethp_max)*100, 0)
  if pethp > 0 then
    -- Only show the pet HP bar if there is pet HP
    phpbar:show()
    phpbar:setValue(pethp, pethp_max)
    phpbar:setText("Pet HP: "..pethp_per.."%")
  else
    -- No pets, no pet HP bar
    phpbar:hide()
  end
  
  -- Start map capture
  -- enableTrigger("1 TEST MapCaptureStart")
  -- send("map")
  
end

registerAnonymousEventHandler("UI_UpdatePrompt", "UpdatePrompt")
