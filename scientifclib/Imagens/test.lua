--
-- Created by IntelliJ IDEA.
-- User: MORADIA082663
-- Date: 07/07/2019
-- Time: 09:34
-- To change this template use File | Settings | File Templates.
Image = require('Image')
Cor = require('Color')
Draw = require('Draw')
amarelo = Cor.new('RGB', 255, 0, 0)
im = Image.new(1080, 1080,25,25, Cor.white, 'RGB')
--print(amarelo)
--print(im)

--Draw.circle(im,Cor.blue,im.sh/2,im.sw/2,(im.sh+im.sw)/20,(im.sh+im.sw)/600)

local function f(x,y)
    return x
end

local function f1(x, y)
    return y
end

local function f2(x,y)
    return 30*x^3-x^2+0.00013 - y
end

Draw.FUNCTION2(im,
    --[[cor]] Cor.black,
    --[[espessura (0~100)]] 1,
    --[[xi limite]] -1,
    --[[xf limite]] 1,
    --[[yi limite]] -1,
    --[[yf limite]] 1,
    --[[f1(x,y) =  0 ...]] f,
    --[[f1(x,y) =  0 ...]] f1,
    --[[f1(x,y) =  0 ...]] f2)

print(im:save("minhafototo", "ppm"))
print(im.saved)

