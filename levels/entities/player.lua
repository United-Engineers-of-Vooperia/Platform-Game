player = {}
player.new = function(world, x, y, width, height, rotated)
    local playerObject = createObject(world, "Rectangle", "dynamic", x, y, width, height, rotated)
    
    -- Set fixed rotation for the player object
    playerObject:setFixedRotation(true)

    playerObject.x, playerObject.y = x, y
    
    function playerObject:update(dt)
        self.x, self.y = self:getPosition()
    end

    return playerObject
end

