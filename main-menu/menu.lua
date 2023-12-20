menu = {}

local Button = require("main-menu.Menu.Menubutton")

-- Move button creation below scene initialization
local play = Button.createButton("play", centerX, centerY - 120, 200, 50, "Play")
local options = Button.createButton("options", centerX, centerY - 60, 200, 50, "Options")
local quit = Button.createButton("quit", centerX, centerY - 0, 200, 50, "Quit")

local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

function menu:enter()
    menuMusic:setVolume(volume - 0.3)
    
end

function menu:leave()
end

function menu:draw()
    love.graphics.setShader(blur)
    love.graphics.draw(background, -20)
    love.graphics.draw(foreground, -20)
    love.graphics.setShader()

    play:render()
    options:render()
    quit:render()

    debugDraw()
end

function menu:update(dt)
    menuMusic:update(dt)
end

function menu:mousereleased(x, y, button)
    if button == 1 then
        if options:isPointInside(x, y) then
            options:onPointerRelease()
        elseif quit:isPointInside(x, y) then
            quit:onPointerRelease()
        elseif play:isPointInside(x, y) then
            play:onPointerRelease()
        end
    end
end