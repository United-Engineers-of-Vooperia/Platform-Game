local function createButton(buttonName, x, y, width, height, buttonText)
    local button = {
        buttonName = buttonName,
        x = x,
        y = y,
        width = width,
        height = height,
        text = buttonText or "Button Text",  -- Use provided text or a default value
    }

    function button:isPointInside(px, py)
        return px >= self.x and px <= self.x + self.width and py >= self.y and py <= self.y + self.height
    end

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

    function button:render()
        love.graphics.setColor(1, 1, 1, 0.3)
        love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
        love.graphics.setColor(1, 1, 1, 1)

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

        -- Draw the text
        love.graphics.print(self.text, textX, textY)
    end

    return button
end

return {
    createButton = createButton
}
