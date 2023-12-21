-- Import the Camera library
Camera = require("libraries/hump.camera")

-- Create a new Camera instance
cam = Camera()

-- Initial camera position and parameters
local posX, posY = 980, 540
local speed = 200
local zoomLevel = 1
local minZoom = 0.8
local maxZoom = 2.0

-- Function to reset the camera to initial parameters
function resetCam()
    posX, posY = 980, 540
    zoomLevel = 1

    cam:zoomTo(zoomLevel)
end

-- Function called when the mouse wheel is moved to handle zooming
function love.wheelmoved(x, y)
    if y > 0 then
        -- Zoom in
        zoomLevel = zoomLevel * 1.1
    elseif y < 0 then
        -- Zoom out
        zoomLevel = zoomLevel / 1.1
    end

    -- Clamp the zoom level within the specified range
    zoomLevel = math.max(minZoom, math.min(maxZoom, zoomLevel))

    -- Apply the zoom level to the camera
    cam:zoomTo(zoomLevel)
end

-- Function to update the camera position based on input
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

    -- Set the base speed for camera movement
    speed = 200

    -- Double the speed when the left shift key is held down
    if love.keyboard.isDown("lshift") then
        speed = 400
    end

    -- Move the camera to the specified position
    cam:lookAt(posX, posY)
end
