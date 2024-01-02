player = {}
player.new = function(world, x, y, width, height, rotated)
    local slopeWidth = width / 6  -- Adjust the slope width as needed
    local slopeHeight = height / 6  -- Adjust the slope height as needed

    -- Vertices for a rectangle with sloped edges on all corners
    local vertices = {
        slopeWidth, 0,                  -- Top-left slope
        width - slopeWidth, 0,          -- Top-right slope
        width, slopeHeight,             -- Top-right corner
        width, height - slopeHeight,    -- Bottom-right corner
        width - slopeWidth, height,     -- Bottom-right slope
        slopeWidth, height,             -- Bottom-left slope
        0, height - slopeHeight,        -- Bottom-left corner
        0, slopeHeight                  -- Top-left corner
    }

    local playerObject = bf.Collider.new(world, "Polygon", vertices, x, y, rotated)
    playerObject:setType("dynamic")
    playerObject:setFixedRotation(true)
    playerObject:setMass(5)

    local PLAYER_SPEED = 300
    local JUMP_FORCE = 50000

    function playerObject:update(dt)
        self.x, self.y = self:getPosition()
        self.velx, self.vely = self:getLinearVelocity()

        -- Vertical Movement (Jumping)
        if love.keyboard.isDown("w") and not self.jumping then
            self:applyForce(0, -JUMP_FORCE)
            self.jumping = true
        end

        -- Horizontal Movement
        local moveX = 0
        if love.keyboard.isDown("d") then
            moveX = PLAYER_SPEED
        elseif love.keyboard.isDown("a") then
            moveX = -PLAYER_SPEED
        end

        self:setLinearVelocity(moveX, self.vely)

        -- Reset jumping state when key is released
        if not love.keyboard.isDown("w") and self.jumping then
            self.jumping = false
        end
    end

    return playerObject
end