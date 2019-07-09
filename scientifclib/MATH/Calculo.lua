--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 09/07/2019
-- Time: 18:02
--
--- [[ funcoes para calcular integral pelos metodos dos trapezios e 1/3 de simpson]]

local CALCULO = {}
local mathsci = require('mathSci')
CALCULO.__index = CALCULO
-- FUNCTION = f(x)
CALCULO.trapezio = function(a, b, FUNCTION, N)
    N = math.abs(N)
    local fator = 1
    if b < a then
        a, b = b, a
        fator = -fator
    end
    local passo_h = (b - a) / N
    fator = fator * passo_h / 2
    local result = FUNCTION(a) + FUNCTION(b)
    N = N - 1
    for i = 1, N do
        result = result + 2 * FUNCTION(a + passo_h * i)
    end
    return result * fator
end

CALCULO.simpson = function(a, b, FUNCTION, N)
    N = math.abs(N)
    local fator = 1
    local erro = 'OK'
    if b < a then
        a, b = b, a
        fator = -fator
    end
    local passo_h = (b - a) / N
    local termo
    fator = fator * passo_h / 3
    local result = FUNCTION(a) + FUNCTION(b)
    N = N - 1
    for i = 1, N do
        --        print(result)
        termo = FUNCTION(a + passo_h * i)
        if mathsci.isnan(termo) then
            erro = 'find a nan'
        else
            result = result + (i % 2 == 0 and 2 or 4) * termo
        end
    end
    return (result * fator), erro;
end



CALCULO.derivadan = function(FUNCION, a, n, raio, particoes)
    raio = raio or 10 -- raio p ou 1
    particoes = particoes or 1000 -- N ou 25 particoes
    local function g(o) -- g(o) = f(p*e^(io)+a) * e^(-i*n*o)
        return FUNCION(raio * mathsci.exp(mathsci.complex.i * o) + a) * mathsci.exp(-mathsci.complex.i * o * n)
    end
        local integrate, warn = CALCULO.simpson(0, math.pi * 2, g, particoes)
        if integrate == 0 then warn = "erro ao dividir a integral "..integrate end
     return  integrate* mathsci.fat(n) / (2 * math.pi * raio ^ n), warn;

end


return CALCULO