ground = {}
ground.__index = ground
setmetatable(ground, bf.Collider)

function ground.new(world, x, y, width, height, rotated)
    local success, ground = pcall(bf.Collider.new, world, "Rectangle", x, y, width, height)
    if success then
        if rotated ~= nil then
            ground:setAngle(rotated)
        else 
            ground:setAngle(0)
        end
       ground:setType("static")
    else
       -- Handle the error (print an error message)
       print("Error creating ground:", ground)
    end
    return ground.new
end

killBlock = {}
killBlock.__index = killBlock
setmetatable(killBlock, bf.Collider)

function killBlock.new(world, x, y, width, height, rotated)
    local success, killBlock = pcall(bf.Collider.new, world, "Rectangle", x, y, width, height)
    if success then
        if rotated ~= nil then
            killBlock:setAngle(rotated)
        else 
            killBlock:setAngle(0)
        end
        killBlock:setType("static")
    else
       -- Handle the error (print an error message)
       print("Error creating killBlock:", killBlock)
    end
    return killBlock.new
end


wall = {}
wall.__index = wall
setmetatable(wall, bf.Collider)

function wall.new(world, x, y, width, height, rotated)
    local success, wall = pcall(bf.Collider.new, world, "Rectangle", x, y, width, height)
    if success then
        if rotated ~= nil then
            wall:setAngle(rotated)
        else 
            wall:setAngle(0)
        end
        wall:setType("static")
    else
       -- Handle the error (print an error message)
       print("Error creating wall:", wall)
    end
    return wall.new
end