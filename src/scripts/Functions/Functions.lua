-- Utility Functions

-- Commas!
function commaValue(n)
  -- credit http://richard.warburton.it
  -- http://lua-users.org/wiki/FormattingNumbers
  local left, num, right = string.match(n, '^([^%d]*%d)(%d*)(.-)$')
  return left .. (num:reverse():gsub('(%d%d%d)', '%1,'):reverse()) .. right
end


function firstToUpper(str)
    -- http://lua-users.org/wiki/StringRecipes
  return (str:gsub("^%l", string.upper))
end


function centerText(text)
  -- Center a string of text based on a border length
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
