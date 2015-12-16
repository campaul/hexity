-- Based on the information from http://www.redblobgames.com/grids/hexagons/

require 'object'

Hex = Object:extend()

function Hex:constructor(x, y)
    self.x = x
    self.y = y
end

function Hex:corner(x, y, scale, i)
    local angle = math.pi / 180 * (60 * i + 30)

    local point_x = 0
    local point_y = 0

    point_x = x + scale * math.cos(angle)
    point_y = y + scale * math.sin(angle)

    return point_x, point_y
end

function Hex:get_points(scale)
    local points = {}
    
    for i = 0, 5 do
        local width = 0
        local height = 0

        local horiz = 0
        local vert = 0

        height = scale * 2
        width = math.sqrt(3)/2 * height
        vert = height * 3/4
        horiz = width

        local vert_offset = 0
        local horiz_offset = 0

        if self.y % 2 == 0 then
            horiz_offset = horiz / 2
        end

        local point_x, point_y = self:corner(
            self.x * horiz + horiz_offset,
            self.y * vert + vert_offset,
            scale,
            i
        )
        points[2*i+1] = point_x
        points[2*i+2] = point_y
    end

    return points
end

function Hex:draw(graphics, scale)
    graphics.polygon('line', self:get_points(scale))
end

HexMap = Object:extend()

function HexMap:constructor(width, height)
    self.width = width
    self.height = height
end

function HexMap:draw(graphics, scale)
    for x = 0, self.width do
        for y = 0, self.height do
            Hex:new(x, y):draw(graphics, scale)
        end
    end
end
