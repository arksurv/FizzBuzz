local fizzbuzzer = require("fizzbuzzer")

local buzzer = fizzbuzzer.new(5)

buzzer:addFizzType("Fizz", 3, 1)
buzzer:addFizzType("Buzz", 5, 3)
buzzer:addFizzType("Able", 7, 2, "able")

for t = 1, 150 do
  print(buzzer[t])
end
