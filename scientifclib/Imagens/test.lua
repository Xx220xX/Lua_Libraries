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
im = Image.new(1000, 1000, Cor.white, 'RGB')
--print(amarelo)
--print(im)

--Draw.circle(im,Cor.blue,im.sh/2,im.sw/2,(im.sh+im.sw)/20,(im.sh+im.sw)/600)
Draw.FUNCTION_X(im,
    --[[cor]] Cor.cyan,
    --[[espessura ]] 0.05,
    --[[f(x) =  y]] math.sin,
    --[[xi limite]] -10,
    --[[xi limite]] 10,
    --[[yi limite]] -3,
    --[[yi limite]] 3)
local function f(x)
    return 0
end
Draw.FUNCTION_X(im,
    --[[cor]] Cor.black,
    --[[espessura ]] 0.01,
    --[[f(x) =  y]] f,
    --[[xi limite]] -10,
    --[[xi limite]] 10,
    --[[yi limite]] -3,
    --[[yi limite]] 3)


print(im:save("minhafototo", "ppm"))
print(im.saved)

