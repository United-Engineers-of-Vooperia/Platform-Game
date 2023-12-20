settings = {}

local Button = require("main-menu.Settings.Settingsbutton")
local goBack = Button.createButton("return", centerX, centerY - 120, 200, 50, "Return.. are you sure?")

local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

function settings:enter()
end

function settings:leave()
end

function settings:draw()
    love.graphics.setShader(blur)
    love.graphics.draw(background, -20)
    love.graphics.draw(foreground, -20)
    love.graphics.setShader()

    goBack:render()

    debugDraw()
end

function settings:update(dt)
    menuMusic:update(dt)
end

function settings:mousereleased(x, y, button)
	if button == 1 then
        if goBack:isPointInside(x, y) then
            goBack:onPointerRelease()
        end
    end
end