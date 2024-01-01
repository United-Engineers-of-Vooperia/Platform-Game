-- Set debug mode
debug = true

-- Load debug libraries if debug mode is enabled
if debug == true then
    require("libraries/lovedebug")
    debugGraph = require("libraries/debugGraph")
end

-- Function to draw debug information
function debugDraw()
    if debug == true then
        fpsGraph:draw()
        memGraph:draw()
        dtGraph:draw()
        love.graphics.print("Debug Enabled", centerX + 950, centerY + 520)
    end
end

-- Function to initialize debug tools
function debugLoad()
    if debug == true then
        fpsGraph = debugGraph:new('fps', 0, 0, nil, nil, 0.005)
        dtGraph = debugGraph:new('custom', 0, 30, nil, nil, 0.05)
        memGraph = debugGraph:new('mem', 0, 60, nil, nil, 0.3)
    end
end

-- Function to update debug information
function debugUpdate(dt)
    if debug == true then
        fpsGraph:update(dt)
        memGraph:update(dt)
        dtGraph:update(dt, math.floor(dt * 1000))
        dtGraph.label = 'DT: ' ..  round(dt, 4)
    end
end

-- Enable debug key bindings
if debug == true then
    function love.keypressed(key)
        if key == "f1" then
            local major, minor, revision, codename = love.getVersion()
            local str = string.format("Version %d.%d.%d - %s", major, minor, revision, codename)
            print(str, 20, 20)
        end

        -- Uncomment the line below to print the pressed key
        -- print(key)
    end
end
