-- Define a table to represent the object creation
createObject = {}

-- Function to create different types of objects in the physics world
function createObject.new(world, colliderType, objectType, x, y, width, height, rotated)
    local obj = {}
    obj.__index = obj
    setmetatable(obj, bf.Collider)

    -- Attempt to create a new collider object
    local success, newObj

    if colliderType == "Circle" then
        success, newObj = pcall(bf.Collider.newCircle, world, x, y, width / 2)
    elseif colliderType == "Rectangle" then
        success, newObj = pcall(bf.Collider.newRectangle, world, x, y, width, height)
    elseif colliderType == "Polygon" then
        success, newObj = pcall(bf.Collider.newPolygon, world, x, y, {0, 0, width, 0, width, height, 0, height})
    else
        print("Invalid collider type:", colliderType)
        return nil
    end

    if success then
        -- Set rotation angle if provided, default to 0 if not
        newObj:setAngle(rotated or 0)
    else
        -- Handle the error by printing an error message
        print("Error creating " .. objectType .. ":", newObj)
        return nil
    end

    return newObj
end

-- Define different object types and their creation functions
ground = {}
ground.new = function(world, x, y, width, height, rotated)
    return createObject.new(world, "Rectangle", "ground", x, y, width, height, rotated)
end

killBlock = {}
killBlock.new = function(world, x, y, width, height, rotated)
    return createObject.new(world, "Rectangle", "killBlock", x, y, width, height, rotated)
end

wall = {}
wall.new = function(world, x, y, width, height, rotated)
    return createObject.new(world, "Rectangle", "wall", x, y, width, height, rotated)
end
