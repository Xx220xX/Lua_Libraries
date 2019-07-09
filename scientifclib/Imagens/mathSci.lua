--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 07/07/2019
-- Time: 21:37

local mathSci = {}
mathSci.__index = mathSci
mathSci.floor = math.floor
mathSci.map = function(x, in_min, in_max, out_min, out_max)
      return ((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min)
end
return mathSci