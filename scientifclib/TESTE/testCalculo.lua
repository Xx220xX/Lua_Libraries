--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 09/07/2019
-- Time: 20:22
--
CALCULO = require('scientifclib.MATH.Calculo')
mathSci = require('scientifclib.MATH.mathSci')
function f(x)
    return mathSci.exp(x^2)
end

print('integral de  0  a 2 \n     Regra dos trapezios '..(CALCULO.trapezio(0, 2, f, 10)))
print('     1/3 de Simpson '..CALCULO.simpson(0, 2, f, 10))

for i = 0, 30 do

    r = CALCULO.derivada_n(--[[ function]] f, --[[ponto]]2, --[[numero de ordem ]] i, --[[raio ]] 1, --[[divisoes]] 1000)
    print("     derivada de ordem "..i..": f(2) = " .. r )
end