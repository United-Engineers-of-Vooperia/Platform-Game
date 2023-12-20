Camera = require("libraries/hump.camera")
cam = Camera()

local posX, posY = 980, 540
local speed = 200
local zoomLevel = 1
local minZoom = 0.8
local maxZoom = 2.0

function resetCam()
    posX, posY = 980, 540
    zoomLevel = 1
end

function love.wheelmoved(x, y)
    if y > 0 then
        -- Zoom in
        zoomLevel = zoomLevel * 1.1
    elseif y < 0 then
        -- Zoom out
        zoomLevel = zoomLevel / 1.1
    end

    zoomLevel = math.max(minZoom, math.min(maxZoom, zoomLevel))

    cam:zoomTo(zoomLevel)
end

function updateCam(dt)
    -- Check arrow keys for movement with diagonal support
    if love.keyboard.isDown("d") then
        posX = posX + (speed * dt)
    elseif love.keyboard.isDown("a") then
        posX = posX - (speed * dt)
    end
    if love.keyboard.isDown("s") then
        posY = posY + (speed * dt)
    elseif love.keyboard.isDown("w") then
        posY = posY - (speed * dt)
    end
    speed = 200

    if love.keyboard.isDown("lshift") then
        speed = 400
    end

    -- Move the camera based on arrow key input
    cam:lookAt(posX, posY)
end