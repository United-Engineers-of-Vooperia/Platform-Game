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

    -- Play menu music
    menuMusic:play()
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
    Timer:update(dt)
    Gamestate.update(dt)

    -- Call the debugUpdate function
    debugUpdate(dt)
end
