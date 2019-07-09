--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 07/07/2019
-- Time: 21:37

local mathSci = {}
mathSci.complex = require("complex")
mathSci.__index = mathSci
mathSci.floor = math.floor

mathSci.i = mathSci.complex.new(0, 1)
mathSci.pi = math.pi
mathSci.e = math.exp(1)

mathSci.map = function(x, in_min, in_max, out_min, out_max)
    return ((x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min)
end

-- ln(z)
function mathSci.log(z)
    return mathSci.complex.log(z)
end

-- log(z)
function mathSci.log10(z)
    local xx = mathSci.complex.tocomplex(z)
    return (mathSci.log(xx) / mathSci.log(10))
end

-- e^x
function mathSci.exp(z)
   return mathSci.complex.exp(z)
end

-- raiz(z)
function mathSci.sqrt(x)
    return mathSci.complex.pow(x, 0.5)
end

-- Trigonometric

function mathSci.sin(x)
    local xx = mathSci.complex.tocomplex(x)
    return mathSci.complex.new(math.sin(xx.re) * math.cosh(xx.im),
        math.cos(xx.re) * math.sinh(xx.im))
end

function mathSci.cos(x)
    local xx = mathSci.complex.tocomplex(x)
    return mathSci.complex.new(math.cos(xx.re) * math.cosh(xx.im),
        -(math.sin(xx.re)) * math.sinh(xx.im))
end

function mathSci.tan(x)
    local xx = mathSci.complex.tocomplex(x)
    return (mathSci.sin(xx) / mathSci.cos(xx))
end

function mathSci.asin(x)
    local xx = mathSci.complex.tocomplex(x)
    return (-(mathSci.complex.i) * mathSci.log(mathSci.complex.i * xx + mathSci.sqrt(1 - xx ^ 2)))
end

function mathSci.acos(x)
    local xx = mathSci.complex.tocomplex(x)
    return (math.pi / 2 - mathSci.asin(xx))
end

function mathSci.atan(x)
    local xx = mathSci.complex.tocomplex(x)
    return (0.5 * mathSci.complex.i * mathSci.log((1 - mathSci.complex.i * xx) / (1 + mathSci.complex.i * xx)))
end

-- Hyperbolic

function mathSci.sinh(x)
    return ((mathSci.exp(x) - mathSci.exp(-x)) / 2)
end

function mathSci.cosh(x)
    return ((mathSci.exp(x) + mathSci.exp(-x)) / 2)
end

function mathSci.tanh(x)
    local xx = mathSci.complex.tocomplex(x)
    return (mathSci.sinh(xx) / mathSci.cosh(xx))
end

function mathSci.asinh(x)
    return mathSci.log(x + mathSci.sqrt(x ^ 2 + 1))
end

function mathSci.acosh(x)
    return mathSci.log(x + mathSci.sqrt(x + 1) * mathSci.sqrt(x - 1))
end

function mathSci.atanh(x)
    return (0.5 * mathSci.log((1 + x) / (1 - x)))
end











return mathSci
