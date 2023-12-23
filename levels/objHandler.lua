-- Required Module to create objects
require("levels/levelObjTypes")

-- Table to store game objects
local gameObjects = {}

-- Function to create different types of objects in the physics world
function createObject(world, objectType, objectClass, x, y, width, height, rotated)
    -- Create a new collider object based on object type
    local success, newObj = pcall(bf.Collider.new, world, objectType, x, y, width, height)

    if success then
        -- Set rotation angle if provided, default to 0 if not
        newObj:setAngle(rotated or 0)

        -- Set the object type based on the provided class
        if objectClass == "static" then
            newObj:setType("static")
        elseif objectClass == "dynamic" then
            newObj:setType("dynamic")
        else
            -- Handle the error for an unsupported object class
            print("Error creating " .. objectType .. ", with Object Class of: " .. objectClass, "Unsupported Object Class?")
            return nil
        end

        -- Store the created object directly in the objectData table
        local objectData = {x = x, y = y, width = width, height = height, rotated = rotated, obj = newObj}
        table.insert(gameObjects, objectData)
    else
        -- Handle the error if creating the object is unsuccessful
        print("Error creating " .. objectType .. ", with Object Class of: " .. objectClass)
        return nil
    end

    return newObj
end

-- Function to destroy all game objects
function destroyAllObjects()
    print("Destroying all objects...")

    for _, objectData in ipairs(gameObjects) do
        -- Destroy the Breezefield collider
        objectData.obj:destroy()
    end

    -- Print the number of destroyed objects
    print("Destroyed " .. #gameObjects .. " objects")

    -- Clear the gameObjects table
    gameObjects = {}
end
