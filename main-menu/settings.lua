-- Define a table to represent the settings menu
settings = {}

-- Load necessary modules and create a button using the SettingsButton module
local Button = require("main-menu.Settings.Settingsbutton")
local goBack = Button.createButton("return", centerX, centerY - 120, 200, 50, "Return.. are you sure?")
local github = Button.createButton("github", centerX + 950, centerY + 450, 100, 50, "Project Link!")

-- Load background and foreground images for the menu
local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

-- Function called when entering the settings menu
function settings:enter()
end

-- Function called when leaving the settings menu
function settings:leave()
end

-- Draw function for the settings menu
function settings:draw()
    -- Apply a blur shader and draw the background and foreground images
    love.graphics.setShader(blur)
    love.graphics.draw(background, -20)
    love.graphics.draw(foreground, -20)

    -- Apply a blur shader and render the "Go Back" button
    goBack:render()
    github:render()
    love.graphics.setShader()

    -- Call the debugDraw function
    debugDraw()
end

-- Update function for the settings menu
function settings:update(dt)
    -- Update the menu music
    menuMusic:update(dt)
end

-- Function called when the mouse button is released
function settings:mousereleased(x, y, button)
    if button == 1 then
        -- Check if the mouse pointer is inside the "Go Back" button
        if goBack:isPointInside(x, y) then
            goBack:onPointerRelease()
        elseif github:isPointInside(x, y) then
            github:onPointerRelease()
        end
    end
end
