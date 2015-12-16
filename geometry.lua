require 'object'

Point = Object:extend()

function Point:constructor(x, y)
    self.x = x
    self.y = y
end

Vector = Point:extend()

function Vector:length()
    return math.sqrt(math.pow(self.x, 2) + math.pow(self.y, 2))
end
