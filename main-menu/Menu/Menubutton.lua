-- Function to create a button with specified properties
local function createButton(buttonName, x, y, width, height, buttonText)
    -- Create a button object with properties
    local button = {
        buttonName = buttonName,
        x = x,
        y = y,
        width = width,
        height = height,
        text = buttonText or "Button Text",  -- Use provided text or a default value
    }

    -- Function to check if a point is inside the button
    function button:isPointInside(px, py)
        return px >= self.x and px <= self.x + self.width and py >= self.y and py <= self.y + self.height
    end

    -- Function to handle pointer release events for the button
    function button:onPointerRelease()
        if self.buttonName == "options" then
            Gamestate.switch(settings)
        elseif self.buttonName == "quit" then
            love.event.quit()
        elseif self.buttonName == "play" then
            Gamestate.switch(level1)
            menuMusic:stop()
        end
    end

    -- Function to render the button
    function button:render()
        -- Set a semi-transparent color for the button
        love.graphics.setColor(1, 1, 1, 0.3)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1, 1)  -- Reset color to opaque

        -- Calculate the center of the button
        local centerX = self.x + self.width / 2
        local centerY = self.y + self.height / 2

        -- Set the text color
        love.graphics.setColor(1, 1, 1, 1)

        -- Set the font and size (adjust as needed)
        local font = love.graphics.newFont(15)
        love.graphics.setFont(font)

        -- Calculate the position to center the text
        local textX = centerX - font:getWidth(self.text) / 2
        local textY = centerY - font:getHeight() / 2

        love.graphics.setShader()
        -- Draw the text
        love.graphics.print(self.text, textX, textY)
        love.graphics.setShader(blur)
    end

    -- Return the created button object
    return button
end

-- Export the createButton function
return {
    createButton = createButton
}
