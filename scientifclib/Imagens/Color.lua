--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 07/07/2019
-- Time: 10:55
--
local Color = {}

Color.__index = Color
Color.new = function(type, ...)
    local arg = { ... }
    local cor = {}
    if type:upper() == "RGB" then
        cor.type = type:upper()
        cor.r, cor.g, cor.b = arg[1] or 0, arg[2] or 0, arg[3] or 0
        return setmetatable(cor, Color)
    end
end
Color.__tostring = function(v)
    local s = string.format("type[%s]", v.type)
    if v.type == "RGB" then
        return s .. string.format(" {r = %d, g = %d, b = %d}", v.r, v.g, v.b)
    end
end
Color.blue = Color.new("RGB",0,0,255)
Color.yellow = Color.new("RGB",255,255,0)
Color.red = Color.new("RGB",255)
Color.cyan = Color.new("RGB",0,255,255)
Color.white = Color.new("RGB",255,255,255)
Color.black = Color.new("RGB",0,0,0)

return Color

