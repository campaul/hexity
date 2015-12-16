require 'hex'

function love.draw()
    map = HexMap:new(10, 10)
    map:draw(love.graphics, 25)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end
