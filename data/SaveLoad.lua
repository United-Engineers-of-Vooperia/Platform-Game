show = require("libraries/show")

function createNewSave(fileNumber)
    -- date for current save file
    data = {}
    
    if fileNumber == nil then 
        fileNumber = 1
    end
    data.fileNumber = fileNumber -- file being used

    -- game state information
    

end


function saveGame()
    data.saveCount = data.saveCount + 1
    
    if data.fileNumber == 1 then
        love.filesystem.write("file1.lua", table.show(data, "data"))
    end

    if data.fileNumber == 2 then
        love.filesystem.write("file2.lua", table.show(data, "data"))
    end

    if data.fileNumber == 3 then
        love.filesystem.write("file3.lua", table.show(data, "data"))
    end
end


function loadGame(fileNumber)
    if fileNumber == 1 then
        if love.filesystem.getInfo("file1.lua") ~= nil then
            local data = love.filesystem.load("file1.lua")
            data()
        else
            startFresh(1)
            return "No data fouund for save file #1"
        end

    elseif fileNumber == 2 then
        if love.filesystem.getInfo("file2.lua") ~= nil then
            local data = love.filesystem.load("file2.lua")
            data()
        else
            startFresh(2)
            return "No data fouund for save file #2"
        end

    elseif fileNumber == 3 then
        if love.filesystem.getInfo("file3.lua") ~= nil then
            local data = love.filesystem.load("file3.lua")
            data()
        else
            startFresh(3)
            return "No data fouund for save file #3"
        end
    end
end


