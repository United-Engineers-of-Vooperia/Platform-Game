require("./debug")
require("./init")
require("main-menu.menu")
require("main-menu.settings")

function love.load()
    debugLoad()
    Gamestate.registerEvents()
    Gamestate.switch(menu)
    menuMusic:play()
end

function love.draw()
    love.graphics.setCanvas(canvas)
        love.graphics.clear(0, 0, 0, 1)
        Gamestate.draw()
    love.graphics.setCanvas()

    
    debugDraw()
end

function love.update(dt)
    Timer:update(dt)
    Gamestate.update(dt)

    debugUpdate(dt)
end