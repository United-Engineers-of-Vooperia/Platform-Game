debug = true

if debug == true then
    require("libraries/lovedebug")
    debugGraph = require("libraries/debugGraph")
end

function debugDraw()
    if debug == true then
        fpsGraph:draw()
        memGraph:draw()
        dtGraph:draw()
        love.graphics.print("Debug Enabled", centerX + 950, centerY + 520)
    end
end

function debugLoad()
    if debug == true then
        fpsGraph = debugGraph:new('fps', 0, 0, nil, nil, 0.005)
        dtGraph = debugGraph:new('custom', 0, 30, nil, nil, 0.05)
        memGraph = debugGraph:new('mem', 0, 60, nil, nil, 0.3)
    end
end

function debugUpdate(dt)
    if debug == true then
        fpsGraph:update(dt)
        memGraph:update(dt)
        dtGraph:update(dt, math.floor(dt * 1000))
        dtGraph.label = 'DT: ' ..  round(dt, 4)
    end
end

if debug == true then
    function love.keypressed(key)
        if key == "f1" then
            local major, minor, revision, codename = love.getVersion()
            local str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
            print(str, 20, 20)
        end

        --print(key)
    end
end