local fizzbuzzer = {}

local function selfReturn(ind, str)
  return str
end

local function addFizzType(self, phrase, mod, priority, nonFirstPhrase)
  nonFirstPhrase = nonFirstPhrase or phrase
  priority = priority or 1

  self._fizzes[priority] = function(ind, str)
    if ind % mod == 0 then
      if str == "" then
        str = str..phrase
      else
        str = str..nonFirstPhrase
      end
    end

    return str
  end
end

local function removeFizzType(self, priority)
  self._fizzes[priority] = selfReturn
end

local function makeDefaultFizzes(x)
  local default = {}
  for t = 1, x do
    default[t] = selfReturn
  end
  return default
end

local mt = {}
function mt.__index(obj, ind)
  if type(ind) == "number" then
    local output = ""
    for _, v in ipairs(obj._fizzes) do
      output = v(ind, output)
    end

    if output == "" then output = tostring(ind) end
    return output
  end

  return nil
end

function fizzbuzzer.new(fizzes)
  fizzes = fizzes or 10

  local buzzer = {}
  buzzer._fizzes = makeDefaultFizzes(fizzes)
  buzzer.addFizzType = addFizzType
  buzzer.removeFizzType = removeFizzType
  
  return setmetatable(buzzer, mt)
end

return fizzbuzzer
