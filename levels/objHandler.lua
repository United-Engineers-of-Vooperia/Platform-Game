-- Required Module to create objects
require("levels/levelObjTypes")

-- Table to store game objects
local gameObjects = {}

-- Function to create different types of objects in the physics world
function createObject(world, objectType, objectClass, x, y, width, height, rotated)
    -- Create a new object table
    local obj = {}
    obj.__index = obj
    setmetatable(obj, bf.Collider)

    -- Attempt to create a new collider object based on object type
    local success, newObj

    if objectType == "Rectangle" then
        success, newObj = pcall(bf.Collider.new, world, "Rectangle", x, y, width, height)
    elseif objectType == "Circle" then
        success, newObj = pcall(bf.Collider.new, world, "Circle", x, y, width / 2) -- Assuming width is the diameter
    -- Add more conditions for other object types (e.g., "Triangle", "Polygon", etc.)
    else
        print("Unsupported object type: " .. objectType)
        return nil
    end

    if success then
        -- Set rotation angle if provided, default to 0 if not
        if rotated ~= nil then
            newObj:setAngle(rotated)
        else 
            newObj:setAngle(0)
        end

        -- Set the object type based on the provided class
        if objectClass == "static" then
            newObj:setType("static")
        elseif objectClass == "dynamic" then
            newObj:setType("dynamic")
        else
            -- Handle the error for an unsupported object class
            print("Error creating " .. objectType .. ", with Object Class of: " .. objectClass)
            return nil
        end

        -- Store the created object in the gameObjects table along with its variables
        local objectData = {obj = newObj, x = x, y = y, width = width, height = height, rotated = rotated}
        table.insert(gameObjects, objectData)
    else
        -- Handle the error by printing an error message
        print("Error creating " .. objectType .. ", with Object Class of: " .. objectClass)
        return nil
    end

    -- Print statements for debugging
    print("Object created:", newObj)
    print("Object variables:", x, y, width, height, rotated)

    return newObj
end


-- Function to destroy a specific game object
function destroyObject(obj)
    for i, objectData in ipairs(gameObjects) do
        if objectData.obj == obj then
            -- Print debug information
            print("Destroying object:", obj)
            print("Object data before destruction:", objectData)

            obj:destroy()

            -- Remove the object data from the table
            table.remove(gameObjects, i)

            -- Print debug information after destruction
            print("Object destroyed. Remaining objects:", #gameObjects)
            break
        end
    end
end

-- Function to destroy all game objects
function destroyAllObjects()
    for _, objectData in ipairs(gameObjects) do
        -- Destroy the Breezefield collider
        objectData.obj:destroy()
    end

    -- Print debug information before clearing gameObjects table
    print("Destroying all objects...")
    print("Destroyed " .. #gameObjects .. " objects")

    -- Clear the gameObjects table
    gameObjects = {}
end