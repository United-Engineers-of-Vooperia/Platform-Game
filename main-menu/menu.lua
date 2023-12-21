-- Define a table to represent the main menu
menu = {}

-- Load necessary modules and create buttons using the MenuButton module
local Button = require("main-menu.Menu.Menubutton")
local play = Button.createButton("play", centerX, centerY - 120, 200, 50, "Play")
local options = Button.createButton("options", centerX, centerY - 60, 200, 50, "Options")
local quit = Button.createButton("quit", centerX, centerY - 0, 200, 50, "Quit")

-- Load background and foreground images for the menu
local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

-- Function called when entering the main menu
function menu:enter()
    -- Adjust the menu music volume
    menuMusic:setVolume(volume - 0.3)
end

-- Function called when leaving the main menu
function menu:leave()
end

-- Draw function for the main menu
function menu:draw()
    -- Apply a blur shader and draw the background and foreground images
    love.graphics.setShader(blur)
    love.graphics.draw(background, -20)
    love.graphics.draw(foreground, -20)
    
    
    -- Apply a blur shader and render the buttons for Play, Options, and Quit
    play:render()
    options:render()
    quit:render()
    love.graphics.setShader()

    -- Call the debugDraw function
    debugDraw()
end

-- Update function for the main menu
function menu:update(dt)
    -- Update the menu music
    menuMusic:update(dt)
end

-- Function called when the mouse button is released
function menu:mousereleased(x, y, button)
    if button == 1 then
        -- Check if the mouse pointer is inside any of the buttons
        if options:isPointInside(x, y) then
            options:onPointerRelease()
        elseif quit:isPointInside(x, y) then
            quit:onPointerRelease()
        elseif play:isPointInside(x, y) then
            play:onPointerRelease()
        end
    end
end
