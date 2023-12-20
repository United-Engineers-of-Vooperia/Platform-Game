settings = {}

local Button = require("main-menu.Settings.Settingsbutton")
local goBack = Button.createButton("return", centerX, centerY - 120, 200, 50, "Return.. are you sure?")

function settings:enter()
    menuMusic:play()
end

function settings:leave()
    menuMusic:stop()
    love.graphics.setCanvas()
end

function settings:draw()
    goBack:render()
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