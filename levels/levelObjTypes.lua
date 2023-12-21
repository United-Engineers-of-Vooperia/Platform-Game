-- Define different object types for use in createObject function
ground = {}
ground.new = function(world, x, y, width, height, rotated)
    return createObject(world, "Rectangle", "static", x, y, width, height, rotated)
end

killBlock = {}
killBlock.new = function(world, x, y, width, height, rotated)
    return createObject(world, "Rectangle", "static", x, y, width, height, rotated)
end

wall = {}
wall.new = function(world, x, y, width, height, rotated)
    return createObject(world, "Rectangle", "static", x, y, width, height, rotated)
end

exit = {}
exit.new = function(world, x, y, width, height, rotated)
    return createObject(world, "Rectangle", "static", x, y, width, height, rotated)
end

ball = {}
ball.new = function(world, x, y, diameter)
    return createObject(world, "Circle", "dynamic", x, y, diameter)
end