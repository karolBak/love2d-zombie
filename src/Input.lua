--------------------
-- INPUT
--------------------


local Input = {}


Input.load =
    function ()
        return
        { up = false
        , down = false
        , left = false
        , right = false
        , mouseLeft = false
        , mouseLeftPressed = false
        , mouseRight = false
        , mouseRightPressed = false
        , mouse = Vector.null ()
        }
    end


Input.resetPressed =
    function ( input )
        input.mouseLeftPressed = false
        input.mouseRightPressed = false
    end


Input.toVector =
    function ( input )
        local vector = Vector.null ()

        if input.up then
            vector.y = vector.y - 1
        end
        if input.down then
            vector.y = vector.y + 1
        end
        if input.left then
            vector.x = vector.x - 1
        end
        if input.right then
            vector.x = vector.x + 1
        end

        return Vector.normalize ( vector )
    end


Input.keyPressed =
    function ( input, scanCode )
        if scanCode == "w" or scanCode == "up" then
            input.up = true
        elseif scanCode == "s" or scanCode == "down" then
            input.down = true
        elseif scanCode == "a" or scanCode == "left" then
            input.left = true
        elseif scanCode == "d" or scanCode == "right" then
            input.right = true
        end
    end


Input.keyReleased =
    function ( input, scanCode )
        if scanCode == "w" or scanCode == "up" then
            input.up = false
        elseif scanCode == "s" or scanCode == "down" then
            input.down = false
        elseif scanCode == "a" or scanCode == "left" then
            input.left = false
        elseif scanCode == "d" or scanCode == "right" then
            input.right = false
        end
    end


Input.mousePressed =
    function ( input, x, y, button )
        input.mouse = { x = x, y = y }
        if button == 1 then
            input.mouseLeftPressed = true
            input.mouseLeft = true
        elseif button == 2 then
            input.mouseRightPressed = true
            input.mouseRight = true
        end
    end


Input.mouseReleased =
    function ( input, x, y, button )
        input.mouse = { x = x, y = y }
        if button == 1 then
            input.mouseLeftPressed = false
            input.mouseLeft = false
        elseif button == 2 then
            input.mouseRightPressed = false
            input.mouseRight = false
        end
    end


Input.mouseMoved =
    function ( input, x, y )
        input.mouse = { x = x, y = y }
    end


return Input
