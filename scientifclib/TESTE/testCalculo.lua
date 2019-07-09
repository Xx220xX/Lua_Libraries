--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 09/07/2019
-- Time: 20:22
--
CALCULO = require('Calculo')
mathSci = require('mathSci')
function f(x)
    return mathSci.sin(x)
end


print(CALCULO.trapezio(0, 2, f, 10))
print(CALCULO.simpson(0, 2, f, 10))

for i = 0, 20 do
    
    r = CALCULO.derivadan(--[[ function]] f, --[[ponto]]0, --[[numero de ordem ]] i, --[[raio ]] 1,--[[divisoes]] 1000)
    print("f(0)[" .. i .. "] = " .. r)
end
--[[ output
1.4114232
1.4161595
f(0)[0] = 0
f(0)[1] = 1.0
f(0)[2] = 0
f(0)[3] = -1
f(0)[4] = 0
f(0)[5] = 1.0
f(0)[6] = 0
f(0)[7] = -1.0
f(0)[8] = 0
f(0)[9] = 1.0
f(0)[10] = 0
f(0)[11] = -1.0
f(0)[12] = 0
f(0)[13] = 1.0000002
f(0)[14] = 0
f(0)[15] = -0.99991566
f(0)[16] = 0
f(0)[17] = 1.0036584
f(0)[18] = 0
f(0)[19] = 0
f(0)[20] = 0
]]
