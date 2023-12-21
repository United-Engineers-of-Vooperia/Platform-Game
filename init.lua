-- Add more library paths as needed
-- Import necessary libraries
Gamestate = require("libraries/hump.gamestate")
Timer = require("libraries/hump.timer")
audio = require("libraries/wave")
SaveLoad = require("data/SaveLoad")
bf = require("libraries/breezefield")

-- Create a Breezefield world with gravity
world = bf.newWorld(0, 90.81, true)

-- Load game levels
require("levels/level1")

-- Load shaders
blur = love.graphics.newShader("shaders/blur_shader")
blurRadius = 4.0
blur:send("blurRadius", blurRadius)

-- Load music sources
chapter1Music = audio:newSource("levels/level1/Random_song(Guitar).mp3", "stream")
chapter1Music:setLooping(true)

menuMusic = audio:newSource("main-menu/No_More(Piano).mp3", "stream")
menuMusic:setLooping(true)

-- Set default volume
volume = 0.5


-- Load font sources
local Pixelfont = love.graphics.newFont(15, "mono")
love.graphics.setFont(Pixelfont) -- sets default font

-- Function to configure and set up the game window
function window() 
    -- Set the game window to fullscreen
    love.window.setFullscreen(true)

    -- Get desktop dimensions
    local Deskwidth, Deskheight = love.window.getDesktopDimensions()

    -- Default window size
    local defaultWidth = 800
    local defaultHeight = 600

    -- Calculate scaling factors
    local scaleX = Deskwidth / defaultWidth
    local scaleY = Deskheight / defaultHeight

    -- Set the window size to match the scaled dimensions
    love.window.setMode(defaultWidth * scaleX, defaultHeight * scaleY)

    -- Calculate center coordinates
    centerX = love.graphics.getWidth() / 2.3
    centerY = love.graphics.getHeight() / 2

    -- Create a canvas for rendering
    canvas = love.graphics.newCanvas() 

    -- Set the default graphics filter
    love.graphics.setDefaultFilter("nearest", "nearest")

    -- Set the window title
    love.window.setTitle("Platform Game")
end

-- Function to round a number to a specified number of decimal places
function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

-- Call the window function to set up the game window
window()
