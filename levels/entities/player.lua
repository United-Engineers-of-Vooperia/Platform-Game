player = {}
player.new = function(world, x, y, width, height, rotated)
    local playerObject = createObject(world, "Rectangle", "dynamic", x, y, width, height, rotated)
    
    -- Set fixed rotation for the player object
    playerObject:setFixedRotation(true)

    player.x, player.y = playerObject:getPosition()

    return playerObject
end

