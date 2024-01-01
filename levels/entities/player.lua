player = {}
player.new = function(world, x, y, width, height, rotated)
    local playerObject = bf.Collider.new(world, "Rectangle", x, y, width, height, rotated)
    playerObject:setType("dynamic")
    
    -- Set fixed rotation for the player object
    playerObject:setFixedRotation(true)
    playerObject:setMass(5)

    playerObject.x, playerObject.y = x, y

    -- Initial keyPressed state
    local keyPressed = false
    
    -- Update any player related functionality
    function playerObject:update(dt)
        self.x, self.y = self:getPosition()

        -- Check for key presses
        if love.keyboard.isDown("w") then
            -- Perform action only if the key was not pressed before
            if not keyPressed then
                self:applyForce(0, -50000)
                self.y = self.y - 5
                Timer.after(1,
                    function()
                        
                    end
                )
                keyPressed = true  -- Set the key state to pressed
            end
        else
            keyPressed = false  -- Reset the key state when the key is released
        end

        if love.keyboard.isDown("d") then
            self.x = self.x + 5
        elseif love.keyboard.isDown("a") then
            self.x = self.x - 5
        end

        self:setPosition(self.x, self.y)
        self:applyForce(0, 0)
    end

    return playerObject
end

