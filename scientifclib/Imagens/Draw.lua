--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 07/07/2019
-- Time: 11:32
--
local Draw = {}
local mathSci = require('scientifclib.MATH.mathSci')
local floor = math.floor
local round = mathSci.round
local modulo = function(v) return v < 0 and -v or v end
local function positiveOr0(m) return m < 0 and 0 or m end

Draw.__index = Draw
Draw.circle = function(im, color, icenter, jcenter, radius, thickness)

    if not (im and im.is_image and im:is_image()) then
        error("variavel passada nao é uma imagem")
        return
    end
    thickness = 2 * (thickness < 0 and -thickness or thickness)
    local ibegin, jbegin, ifim, jfim, result

    ibegin = floor(positiveOr0(icenter - radius - thickness))
    jbegin = floor(positiveOr0(jcenter - radius - thickness))

    ifim = icenter + radius + thickness
    jfim = jcenter + radius + thickness
    ifim = floor(ifim > im.sh and im.sh or ifim)
    jfim = floor(jfim > im.sw and im.sw or jfim)

    for i = ibegin, ifim do
        for j = jbegin, jfim do
            result = ((i - icenter) ^ 2 + (j - jcenter) ^ 2) ^ 0.5 - radius
            result = result < 0 and -result or result
            --            io.write(i.." "..j.." result : "..result.." espessura " .. thickness)
            if result <= thickness then
                im.m[i][j] = color
                --                io.write(" pintado ")
            end
            --            io.write('\n')
        end
    end
end
Draw.FUNCTION_X = function(im, color, thickness, FUNCTION, xi, xf, yi, yf)
    if not (im and im.is_image and im:is_image()) then
        error("variavel passada nao é uma imagem")
        return
    end
    thickness = modulo(thickness)


    local result
    for i = 1, im.sh do
        for j = 1, im.sw do
            result = modulo(mathSci.map(i, im.sh, 1, yi, yf) - FUNCTION(mathSci.map(j, 1, im.sw, xi, xf)))
            if result <= thickness then
                im.m[i][j] = color
            end
        end
    end
end
Draw.FUNCTION_XY = function(im, color, thickness, FUNCTION, xi, xf, yi, yf)
    if not (im and im.is_image and im:is_image()) then
        error("variavel passada nao é uma imagem")
        return
    end
    thickness = modulo(thickness)
    local result
    for i = 1, im.sh do
        for j = 1, im.sw do
            result = modulo(FUNCTION(mathSci.map(j, 1, im.sw, xi, xf), mathSci.map(i, im.sh, 1, yi, yf)))
            if result <= thickness then
                im.m[i][j] = color
            end
        end
    end
end
Draw.FUNCTIONS = function(im, color, thickness, xi, xf, yi, yf, ...)
    if not (im and im.is_image and im:is_image()) then
        error("variavel passada nao é uma imagem")
        return
    end
    local FUNCTION = { ... }
    thickness = modulo(thickness)

    local result
    for i = 1, im.sh do
        for j = 1, im.sw do

            for k, v in pairs(FUNCTION) do
                result = modulo(v(mathSci.map(j, 1, im.sw, xi, xf), mathSci.map(i, im.sh, 1, yi, yf)))
                if result <= thickness then
                    im.m[i][j] = color
                end
            end
        end
    end
end

Draw.entorno = function(im, i, j, color, pix)
    for ii = i - pix, i + pix do
        for jj = j - pix, j + pix do
            im:pixel(ii, jj, color)
        end
    end
end

Draw.plot = function(im, color, thickness, FUNCTION, xi, xf, yi, yf)

    if not (im and im.is_image and im:is_image()) then
        error("variavel passada nao é uma imagem")
        return
    end
    thickness = modulo(thickness)
    local i, j, x, y;

    for jj = 1, im.sw, 0.1 do
        x = mathSci.map(jj, 1, im.sw, xi, xf)
        y = FUNCTION(x)
        j = round(jj)
        i = round(mathSci.map(-y, yi, yf, 1, im.sh))
        Draw.entorno(im, i, j, color, thickness);
    end
end
Draw.axis = function (im,cor,thickness,xi, xf, yi, yf)
    local function x_axisP(x,y)
        return math.abs(y)<0.2 and  x-math.floor(x) or 0/0
    end
    local function x_axis(x,y)
        return x
    end
    local function y_axisP(x,y)
        return math.abs(x) < 0.2 and y - math.floor(y) or 0/0
    end
    local function y_axis(x,y)
        return y
    end

    Draw.FUNCTIONS(im,
        cor,
        thickness,
        xi,
        xf,
        yi,
        yf,
        x_axis,
        y_axis,
        x_axisP,
        y_axisP)
end


return Draw

