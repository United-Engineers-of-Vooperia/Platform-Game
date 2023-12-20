menu = {}

local Button = require("main-menu.Menu.Menubutton")

-- Move button creation below scene initialization
local play = Button.createButton("play", centerX, centerY - 120, 200, 50, "Play")
local options = Button.createButton("options", centerX, centerY - 60, 200, 50, "Options")
local quit = Button.createButton("quit", centerX, centerY - 0, 200, 50, "Quit")



function menu:enter()
    menuMusic:setVolume(volume - 0.3)
    menuMusic:play()
end

function menu:leave()
    menuMusic:stop()
    love.graphics.setCanvas()
end

function menu:draw()
    play:render()
    options:render()
    quit:render()
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