--
-- Created by IntelliJ IDEA.
-- User: MORADIA082663
-- Date: 07/07/2019
-- Time: 09:34
-- To change this template use File | Settings | File Templates.
Image = require ('scientifclib.Imagens.Image')
Cor = require('scientifclib.Imagens.Color')
Draw = require('scientifclib.Imagens.Draw')
amarelo = Cor.new('RGB', 255, 0, 0)
im = Image.new(1080, 1080,25,25, Cor.white, 'RGB')
--print(amarelo)
--print(im)
--Draw.circle(im,Cor.blue,im.sh/2,im.sw/2,(im.sh+im.sw)/20,(im.sh+im.sw)/600)

local function f(x,y)
    return 0.1*x^2
end

local function f1(x, y)
    return y
end

local function f2(x,y)
    return 30*x^3-x^2+0.00013 - y
end
Draw.plot(im,
--[[cor]] Cor.black,
--[[espessura ]] 2,
--[[f(x) =  y]] f,
--[[xi limite]] -10,
--[[xi limite]] 10,
--[[yi limite]] -10,
--[[yi limite]] 10)

print(im:save("minhafototo", "ppm"))
print(im.saved)

