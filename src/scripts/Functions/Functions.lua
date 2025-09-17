-- Utility Functions

-- Commas in large numbers
function commaValue(n)
  if n == nil then return "" end
  if type(n) == "number" then
    n = tostring(n)
  elseif type(n) ~= "string" then
    return tostring(n) -- handle booleans, tables, etc.
  end

  -- Try to match "digits with optional prefix/suffix"
  local left, num, right = n:match("^([^%d]*%d)(%d*)(.-)$")
  if not left then
    return n -- if no digits, just return unchanged
  end

  return left .. (num:reverse():gsub("(%d%d%d)", "%1,"):reverse()) .. right
end


function commaValueOriginal(n)
  -- credit http://richard.warburton.it
  -- http://lua-users.org/wiki/FormattingNumbers
  local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
  return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end


function firstToUpper(str)
    -- http://lua-users.org/wiki/StringRecipes
  return (str:gsub("^%l", string.upper))
end


-- Center a string of text based on a border length
function centerText(text)
  local border_length = 70
  tlen = string.len(text)
  leading_spaces = ((border_length/2) - (tlen/2))
  t = string.rep(' ', leading_spaces)..text
  return t
end


--Rounding Function
  function round(x, n)
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
  end

-- Trim trailing whitespace
function trim(s)
  return s:gsub("%s+$", "")
end

-- Safe value functions. Helps fight errors from blank or nil variables.
function safe_string(s, default) return (s and s ~= "") and s or default end
function safe_number(n, default) return tonumber(n) or default end
function safe_div(numerator, denominator) return (denominator ~= 0) and (numerator/denominator) or 0 end