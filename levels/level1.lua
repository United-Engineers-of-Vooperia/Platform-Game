level1 = {}

local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

require("levels/objCreation")
require("levels/Mycamera")

world = bf.newWorld(0, 90.81, true)

ground.new(world, 220, 1020, 650, 700, 0.06)
wall.new(world, -50, 500, 100, 1000)
wall.new(world, 0, -50, 5000, 100)

function level1:enter()
    chapter1Music:setVolume(volume)
    chapter1Music:play()
    resetCam()
end

function level1:leave()
    chapter1Music:stop()
end

function level1:update(dt)
    chapter1Music:update(dt)
    updateCam(dt)
    world:update(dt)
end



function level1:keyreleased(button)
    if button == "escape" then
        Gamestate.switch(menu)
    end
end

function level1:draw()
    cam:attach()
        love.graphics.setColor(255, 255, 255, 255)
        if debug == false then
            world:draw()
        end
        love.graphics.draw(background, -10000, -10000, 0, 20, 20)
        love.graphics.draw(foreground)
        if debug == true then
            world:draw()
        end
    cam:detach()

    debugDraw()
end