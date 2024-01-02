-- Load necessary modules and game states
require("./debug")
require("./init")
require("main-menu.menu")
require("main-menu.settings")

-- Function called when the game is loaded
function love.load()
    -- Initialize debugging tools
    debugLoad()

    -- Register game state events and switch to the main menu
    Gamestate.registerEvents()
    Gamestate.switch(menu)

    clicked = false
    clickPos = { x = 0, y = 0 }

    -- Play menu music
    menuMusic:play()
end

-- Handle mouse events
function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        clicked = true
        clickPos = { x = x, y = y }
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button == 1 then
        clicked = false
    end
end

-- Calculate distance for the ruler
function calculateDistance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

-- Function called to draw graphics
function love.draw()
    -- Set the canvas for drawing
    love.graphics.setCanvas(canvas)
        love.graphics.clear(0, 0, 0, 1)
        Gamestate.draw()
    -- Reset canvas settings
    love.graphics.setCanvas()

    -- Call the debugDraw function
    debugDraw()
end

-- Function called to update game logic
function love.update(dt)
    -- Update timers and game state
    Gamestate.update(dt)
    Timer.update(dt)

    -- Call the debugUpdate function
    debugUpdate(dt)
end
