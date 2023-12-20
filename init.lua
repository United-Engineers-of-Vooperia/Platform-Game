-- Add more library paths as needed
Gamestate = require("libraries/hump.gamestate")
Timer = require("libraries/hump.timer")
audio = require("libraries/wave")
SaveLoad = require("data/SaveLoad")
bf = require("libraries/breezefield")


-- levels
require("levels/level1")

-- shaders
blur = love.graphics.newShader("shaders/blur_shader")
blurRadius = 4.0
blur:send("blurRadius", blurRadius)

-- music
chapter1Music = audio:newSource("levels/level1/Random_song(Guitar).mp3", "stream")
chapter1Music:setLooping(true)

menuMusic = audio:newSource("main-menu/No_More(Piano).mp3", "stream")
menuMusic:setLooping(true)

volume = 0.5

local Pixelfont = love.graphics.newFont(15, "mono")
love.graphics.setFont(Pixelfont)














function window() 
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

    canvas = love.graphics.newCanvas() 

    love.graphics.setDefaultFilter("nearest", "nearest")

    love.window.setTitle("Platform Game")
end

function round(number, decimals)
    local power = 10^decimals
    return math.floor(number * power) / power
end

window()