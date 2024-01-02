--[[ 
    Add more library paths as needed
    Import necessary libraries

    Detection of stray globals
    (this just means they havent been used yet,
    useful to find code that isnt neccisary or doesnt do anything;
    this can be copy and pasted to other parts of the code-
    to check for stray variables)

    If text goes by too fast, you can open console with 'Ctrl + F8'
]]
-- Set the default for Global Variables
local pre_globals = {}
if debug == true then
    for n, v in pairs(_G) do
    pre_globals[n] = v
    end
end
-- Libraries
Gamestate = require("libraries/hump.gamestate")
Timer = require("libraries/hump.timer")
Signal = require("libraries/hump.signal")
audio = require("libraries/wave")
SaveLoad = require("data/SaveLoad")
bf = require("libraries/breezefield")
anim8 = require("libraries/anim8")

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

--[[
    Check for Difference in Stray Variables.
    'print' can be changed to 'assert' to stop the game,
    immedietly when detection of stray global variables

    falseCount refers to how many variables it detects that-
    ARENT stay.
]]
local falseCount = 0
if debug == true then
    for n, v in pairs(_G) do
        local Stray = n == 'bf' or pre_globals[n] ~= nil
        if not Stray then
            print('stray global variable: '.. n)
            falseCount = falseCount + 1
        end
    end
end
print() -- Makes a space for better readability
print("Total number of 'true' variables:", falseCount) -- 'true' just refers that they arent stay