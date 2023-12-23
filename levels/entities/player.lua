player = {}
player.new = function(world, x, y, width, height, rotated)
    local playerObject = bf.Collider.new(world, "Rectangle", x, y, width, height, rotated)
    playerObject:setType("dynamic")
    
    -- Set fixed rotation for the player object
    playerObject:setFixedRotation(true)

    playerObject.x, playerObject.y = x, y
    
    function playerObject:update(dt)
        self.x, self.y = self:getPosition()
    end

    return playerObject
end

