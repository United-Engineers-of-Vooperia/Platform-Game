-- Define a table to represent the level
level1 = {}

-- Load background and foreground images for the level
local background = love.graphics.newImage("levels/level1/level1Back.png")
local foreground = love.graphics.newImage("levels/level1/level1.png")

-- Load necessary modules
require("levels/objHandler")
require("levels/Mycamera")
require("levels/entities/player")

-- Create a Breezefield world with gravity
local world = bf.newWorld(0, 90.81, true)

-- Function called when entering the level
function level1:enter()
    -- Set volume and play music for the chapter
    chapter1Music:setVolume(volume)
    chapter1Music:play()
    -- Reset camera position
    resetCam()

    -- Create the environment objects
    ground.new(world, 220, 1020, 650, 700, 0.06)    -- Start pillar
    ground.new(world, 765, 560, 200, 30, 0.08)      -- Swinging platform
    ground.new(world, 1190, 830, 340, 700, -0.12)   -- Second pillar
    ground.new(world, 1600, 705, 100, 1000, 0.085)  -- Third/tall pillar
    ground.new(world, 1790, 620, 340, 100, 0.1)     -- Third/Fourth pillar
    wall.new(world, -50, 500, 100, 1000)            -- Left wall
    wall.new(world, 1970, 500, 100, 1000)           -- Right wall
    wall.new(world, 0, -50, 5000, 100)              -- Ceiling
    killBlock.new(world, 1100, 1200, 1500, 100)     -- Death Zone
    exit.new(world, 1910, 620, 100, 100)            -- Level Exit

    -- Setup the Player
    player:setPosition(220, 600)           -- Sets starting position
    player:applyForce(0, 1000000000000000) -- Sets a huge downward force, essentailly makes-
                                           -- player start on the surface below it automatically
end

--[[
    Create entities.
    These are persistant in current version, 
    will look for a more elegant solution in future versions.
]] 
player = player.new(world, 220, 600, 50, 50)

-- Function called when leaving the level
function level1:leave()
    -- Stop the music when leaving the level
    chapter1Music:stop()
    destroyAllObjects()
end

-- Update function for the level
function level1:update(dt)
    -- Update music and camera
    chapter1Music:update(dt)
    updateCam(dt, false, player)

    -- Print player Position. debug tool, will be removed later
    function love.keypressed(key)
        if key == "p" then
            print(math.floor(player.x), math.floor(player.y))
        end
    end

    -- Update the world
    world:update(dt)
    player:update(dt)
end

-- Function called when a key is released
function level1:keyreleased(button)
    -- Switch to the menu and play menu music when the escape key is released
    if button == "escape" then
        Gamestate.switch(menu)
        menuMusic:play()
    end
end

-- Draw function for the level
function level1:draw()
    -- Attach the camera
    cam:attach()
        -- Set color and draw the world if debug is disabled
        love.graphics.setColor(255, 255, 255, 255)
        if debug == false then
            world:draw()
        end
        -- Draw the background and foreground images
        love.graphics.draw(background, -10000, -10000, 0, 20, 20)
        love.graphics.draw(foreground)
        -- Draw the world again if debug is enabled
        if debug == true then
            world:draw()
        end
    -- Detach the camera
    cam:detach()

    -- Call the debugDraw function
    debugDraw()
end
