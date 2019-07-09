--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 08/07/2019
-- Time: 23:49
--


local complex = {}
complex.new = function(a, b)
    if type(x) == 'number' and type(b) == 'number' then
        return setmetatable({ re = a, im = b }, complex);
    end
    return nil
end
complex.tocomplex = function(x)
    if (type(x) == "number") then return complex.new(x, 0) else return x end
end
complex.complex.__index = complex
--[[operacoes aritmeticas basicas]]
-- Addition .. (a+bi)+(c+di) == (a+c)+(b+d)i
complex.complex.__add = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return new(xx.re + yy.re, xx.im + yy.im)
end

-- Subtraction .. (a+bi)-(c+di) == (a+c)-(b+d)i
complex.__sub = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return new(xx.re - yy.re, xx.im - yy.im)
end

-- Unary minus .. -(a+bi) == -a-bi
complex.__unm = function(x)
    local xx = complex.tocomplex(x)
    return new(-xx.re, -xx.im)
end

-- Multiplication .. (a+bi)*(c+di) == (ac-bd)+(ad+bc)i
complex.__mul = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return new(xx.re * yy.re - xx.im * yy.im,
        xx.re * yy.im + xx.im * yy.re)
end

-- Division .. (a+bi)/(c+di) == ((ac+bd)+(bc-ad)i)/(c^2+d^2)
complex.__div = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return new((xx.re * yy.re + xx.im * yy.im) / (yy.re * yy.re + yy.im * yy.im),
        (xx.im * yy.re - xx.re * yy.im) / (yy.re * yy.re + yy.im * yy.im))
end

-- yth power of x
complex.__pow = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return cmath.pow(xx, yy)
end

-- mod and concat are unsupported
complex.__mod = function(x, y)return end
complex.__concat = function(x, y) error("unsupported operator") end

-- Equality
complex.__eq = function(x, y)
    if ((x.re == y.re) and (x.im == y.im)) then
        return true
    else
        return false
    end
end
complex.__len = function (x)
    return x:abs()
    end
-- Sorry, complex numbers are not comparable...
complex.__lt = function(x, y) error("complex numbers are not comparable") end
complex.__le = function(x, y) error("complex numbers are not comparable") end

-- tostring()
complex.__tostring = function(x)
    if (x.re == 0) then
        if (x.im == 0) then
            return "0"
        else
            return "" .. x.im .. "i"
        end
    else
        if (x.im > 0) then
            return "" .. x.re .. "+" .. x.im .. "i"
        elseif (x.im < 0) then
            return "" .. x.re .. x.im .. "i"
        else
            return "" .. x.re
        end
    end
end

-- tonumber() ... works only if it is actually a real number
complex.__tonumber = function(x)
    if (x.im == 0) then
        return x.re
    else
        return nil
    end
end

--[[ math functions ]]
-- x:conj() ... Complex conjugate
function conj(x)
    return new(x.re, -(x.im))
end

-- x:abs() ... Norm
function abs(x)
    return math.sqrt(x.re ^ 2 + x.im ^ 2)
end

-- x:arg() ... Argument
function arg(x)
    return math.atan2(x.im, x.re)
end


function log(x)
    local xx = complex.tocomplex(x)
    if ((xx.re <= 0) and (xx.im == 0)) then
        if (xx.re == 0) then
            return complex.new(-math.huge, 0)
        else
            return nil
        end
    else
        return complex.new(math.log(xx:abs()), xx:arg())
    end
end

function log10(x)
    local xx = complex.tocomplex(x)
    return (log(xx) / log(10))
end

-- Exponent

function exp(x)
    local xx = complex.tocomplex(x)
    if (xx.im == 0) then
        return complex.new(math.exp(xx.re), 0)
    else
        return complex.new(math.exp(xx.re) * math.cos(xx.im),
            math.exp(xx.re) * math.sin(xx.im))
    end
end

function pow(x, y)
    local base = complex.tocomplex(x)
    local exponent = complex.tocomplex(y)
    if (exponent.im ~= 0) then
        return exp(exponent * log(base))
    elseif ((base.re < 0) and (base.im == 0) and
            (exponent.re * 2 == math.floor(exponent.re * 2))) then
        if (math.floor(exponent.re * 2) % 4 == 0) then
            return complex.new((-base.re) ^ exponent.re, 0)
        elseif (math.floor(exponent.re * 2) % 4 == 1) then
            return complex.new(0, (-base.re) ^ exponent.re)
        elseif (math.floor(exponent.re * 2) % 4 == 2) then
            return complex.new(-((-base.re) ^ exponent.re), 0)
        elseif (math.floor(exponent.re * 2) % 4 == 3) then
            return complex.new(0, -((-base.re) ^ exponent.re))
        end
    elseif ((base.re == 0) and (base.im ~= 0) and
            (exponent.re == math.floor(exponent.re))) then
        if (math.floor(exponent.re) % 4 == 0) then
            return complex.new(base.im ^ exponent.re, 0)
        elseif (math.floor(exponent.re) % 4 == 1) then
            return complex.new(0, base.im ^ exponent.re)
        elseif (math.floor(exponent.re) % 4 == 2) then
            return complex.new(-(base.im ^ exponent.re), 0)
        elseif (math.floor(exponent.re) % 4 == 3) then
            return complex.new(0, -(base.im ^ exponent.re))
        end
    elseif (base:arg() ~= 0) then
        return complex.polar(base:abs() ^ exponent.re,
            base:arg() * exponent.re)
    else
        return complex.new(base.re ^ exponent.re, 0)
    end
end

function sqrt(x)
    local xx = complex.tocomplex(x)
    return pow(xx, 0.5)
end

-- Trigonometric

function sin(x)
    local xx = complex.tocomplex(x)
    return complex.new(math.sin(xx.re) * math.cosh(xx.im),
        math.cos(xx.re) * math.sinh(xx.im))
end

function cos(x)
    local xx = complex.tocomplex(x)
    return complex.new(math.cos(xx.re) * math.cosh(xx.im),
        -(math.sin(xx.re)) * math.sinh(xx.im))
end

function tan(x)
    local xx = complex.tocomplex(x)
    return (sin(xx) / cos(xx))
end

function asin(x)
    local xx = complex.tocomplex(x)
    return (-(complex.i) * log(complex.i * xx + sqrt(1 - xx ^ 2)))
end

function acos(x)
    local xx = complex.tocomplex(x)
    return (math.pi / 2 - asin(xx))
end

function atan(x)
    local xx = complex.tocomplex(x)
    return (0.5 * complex.i * log((1 - complex.i * xx) / (1 + complex.i * xx)))
end

-- Hyperbolic

function sinh(x)
    local xx = complex.tocomplex(x)
    return ((exp(x) - exp(-x)) / 2)
end

function cosh(x)
    local xx = complex.tocomplex(x)
    return ((exp(x) + exp(-x)) / 2)
end

function tanh(x)
    local xx = complex.tocomplex(x)
    return (sinh(xx) / cosh(xx))
end

function asinh(x)
    local xx = complex.tocomplex(x)
    return log(xx + sqrt(xx ^ 2 + 1))
end

function acosh(x)
    local xx = complex.tocomplex(x)
    return log(xx + sqrt(xx + 1) * sqrt(xx - 1))
end

function atanh(x)
    local xx = complex.tocomplex(x)
    return (0.5 * log((1 + xx) / (1 - xx)))
end


return complex;