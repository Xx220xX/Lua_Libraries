--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 08/07/2019
-- Time: 23:49
--


local complex = {}
complex.new = function(a, b)
    if type(a) == 'number' and type(b) == 'number' then
        a = math.abs(a) < 10 ^ -14 and 0 or a
        b = math.abs(b) < 10 ^ -14 and 0 or b
        return setmetatable({ re = a, im = b }, complex);
    end
    return nil
end
complex.iscomplex = function(z)
    return getmetatable(z) == complex
end
complex.tocomplex = function(x)
    if (type(x) == "number") then return complex.new(x, 0) else return complex.iscomplex(x) and x or nil end
end
complex.__index = complex

--[[operacoes aritmeticas basicas]]
-- Addition .. (a+bi)+(c+di) == (a+c)+(b+d)i
complex.__add = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return complex.new(xx.re + yy.re, xx.im + yy.im)
end

-- Subtraction .. (a+bi)-(c+di) == (a+c)-(b+d)i
complex.__sub = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return complex.new(xx.re - yy.re, xx.im - yy.im)
end

-- Unary minus .. -(a+bi) == -a-bi
complex.__unm = function(x)
    local xx = complex.tocomplex(x)
    return complex.new(-xx.re, -xx.im)
end

-- Multiplication .. (a+bi)*(c+di) == (ac-bd)+(ad+bc)i
complex.__mul = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return complex.new(xx.re * yy.re - xx.im * yy.im,
        xx.re * yy.im + xx.im * yy.re)
end

-- Division .. (a+bi)/(c+di) == ((ac+bd)+(bc-ad)i)/(c^2+d^2)
complex.__div = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return complex.new((xx.re * yy.re + xx.im * yy.im) / (yy.re * yy.re + yy.im * yy.im),
        (xx.im * yy.re - xx.re * yy.im) / (yy.re * yy.re + yy.im * yy.im))
end

-- yth power of x
complex.__pow = function(x, y)
    local xx = complex.tocomplex(x); local yy = complex.tocomplex(y)
    return complex.pow(xx, yy)
end
-- concat
complex.__concat = function(x, y) return tostring(x) .. tostring(y) end
-- mod  are unsupported
complex.__mod = function(x, y) error("unsupported operator") end

-- Equality
complex.__eq = function(x, y)
    if ((x.re == y.re) and (x.im == y.im)) then
        return true
    else
        return false
    end
end
-- abs suportado apenas para versoes lua > 5.2
complex.__len = function(x)
    return x:abs()
end
-- Sorry, complex numbers are not comparable...
complex.__lt = function(x, y) error("complex numbers are not comparable") end
complex.__le = function(x, y) error("complex numbers are not comparable") end

-- tostring()
complex.__tostring = function(x)
    local r = ''
    if complex.isnan(x) then return 'nan' end
    if x.re ~= 0 then r = tostring(x.re) elseif x.im == 0 then return '0' end
    if x.im == 0 then return r end
    if x.im < 0 then r = r .. ' - ' end
    if x.im > 0 and x.re ~= 0 then r = r .. ' + ' end
    local b = x.im < 0 and -x.im or x.im

    if b ~= 1 then r = r .. b .. '*' end
    r = r .. 'i'
    return r
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
function complex.conj(x)
    return complex.new(x.re, -(x.im))
end

-- x:abs() ... Norm
function complex.abs(x)
    x = complex.tocomplex(x)
    return math.sqrt(x.re ^ 2 + x.im ^ 2)
end

-- x:arg() ... Argument
function complex.arg(x)
    return math.atan2(x.im, x.re)
end

--function log_2 z
complex.log = function(z, raiz)
    z = complex.tocomplex(z)
    raiz = raiz or 0
    return math.log(complex.abs(z)) + complex.new(0, z:arg() + 2 * raiz * math.pi)
end

-- Exponent

function complex.exp(x)
    local xx = complex.tocomplex(x)
    if (xx.im == 0) then
        return complex.new(math.exp(xx.re), 0)
    else
        return complex.new(math.exp(xx.re) * math.cos(xx.im),
            math.exp(xx.re) * math.sin(xx.im))
    end
end

--function pow for complex
complex.pow = function(c1, c2)
    local w = c2 * complex.log(c1)
    w = complex.exp(w)
    if math.abs(w.im) < 10 ^ -14 then w.im = 0 end
    return w;
end
complex.isnan = function(x)
    x =  complex.tocomplex(x)
    return tostring(x.re) == 'nan' or tostring(x.im) == 'nan'
end



complex.i = complex.new(0, 1)

return complex