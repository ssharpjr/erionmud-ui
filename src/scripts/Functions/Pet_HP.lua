-- Re-Colorize Pet HP!

ui = ui or {}

function GetPetHP()
  -- Create a table of pet HP
  -- I'm sure there is a cleaner way to do this, but here it is...
  
  local t1 = {}
  local t2 = {}
  local php = ""
  
  
  -- Clean up data
  php = ui.PetsHP:gsub("[%%]", "")  -- Remove "%"
  php = php:gsub("[%|]",":")  -- Replace "|" with ":" so it gets split properly
  
  -- Split at the ":"
  for str in string.gmatch(php, "([^:]+)") do
    table.insert(t1, str)
  end
  -- Returns { "1", "100", "2", "100", "3", "100", "4", "100" }
  
  -- Build a new table (max pet count is 10, so 20 entires)
  if t1[1] then table.insert(t2, t1[2]) end
  if t1[3] then table.insert(t2, t1[4]) end
  if t1[5] then table.insert(t2, t1[6]) end
  if t1[7] then table.insert(t2, t1[8]) end
  if t1[9] then table.insert(t2, t1[10]) end
  if t1[11] then table.insert(t2, t1[12]) end
  if t1[13] then table.insert(t2, t1[14]) end
  if t1[15] then table.insert(t2, t1[16]) end
  if t1[17] then table.insert(t2, t1[18]) end
  if t1[19] then table.insert(t2, t1[20]) end

  -- Debug
  --for k, v in ipairs(t2) do
  --  print(k..":"..v)
  --end

  return t2
  
end


function ColorizePetHP()
  -- Add color to the pet HP table depending on value
  -- 100% = green
  -- 76%+ = dark_green
  -- 51%+ = yellow
  -- 26%+ = orange
  -- 0%+  = red
  
  local petTab = GetPetHP()
  local t = {}
  local petStr = ""
  
  -- Add cecho color tags to each value
  for k, v in ipairs(petTab) do
    v = tonumber(v)
    if v == 100 then table.insert(t, "<green>"..v.."<reset>") end
    if v >= 76 and v < 100 then table.insert(t, "<dark_green>"..v.."<reset>") end
    if v >= 51 and v < 76 then table.insert(t, "<yellow>"..v.."<reset>") end
    if v >= 26 and v < 51 then table.insert(t, "<orange>"..v.."<reset>") end
    if v >= 0 and v < 26 then table.insert(t, "<red>"..v.."<reset>") end
  end
  
  -- Create a new cecho-compatible string
  -- Format: 1:100%|2:100%|3:100%|4:100%
  --petStr = "<white>"
  for k, v in ipairs(t) do
    petStr = petStr.."<white>"..k..":"..v.."<white>%|"
  end
  
  --cecho(petStr)
  return petStr

end
