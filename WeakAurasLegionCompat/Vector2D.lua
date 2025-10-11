if not Vector2DMixin then
    ---@class Vector2DMixin
    ---@field x number
    ---@field y number
    Vector2DMixin = {}

    function Vector2DMixin:IsEqualTo(other)
        return self.x == other.x and self.y == other.y
    end

    function Vector2DMixin:Clone()
        return CreateVector2D(self.x, self.y)
    end

    function Vector2DMixin:Add(other)
        self.x = self.x + other.x
        self.y = self.y + other.y
    end

    function Vector2DMixin:Subtract(other)
        self.x = self.x - other.x
        self.y = self.y - other.y
    end

    function Vector2DMixin:GetLength()
        return (self.x^2 + self.y^2)^0.5
    end

    function Vector2DMixin:Normalize()
        local length = self:GetLength()
        if length > 0 then
            self.x = self.x / length
            self.y = self.y / length
        end
    end

    function Vector2DMixin:Dot(other)
        return self.x * other.x + self.y * other.y
    end
end

if not CreateVector2D then
    ---@param x number
    ---@param y number
    ---@return Vector2DMixin
    function CreateVector2D(x, y)
        local newVector = { x = x or 0, y = y or 0 }
        setmetatable(newVector, { __index = Vector2DMixin })
        return newVector
    end
end