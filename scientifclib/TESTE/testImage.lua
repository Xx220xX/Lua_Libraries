--
-- Created by IntelliJ IDEA.
-- User: Xx220xX
-- Date: 07/07/2019
-- Time: 09:34
-- To change this template use File | Settings | File Templates.
Image = require ('scientifclib.Imagens.Image')
Cor = require('scientifclib.Imagens.Color')
Draw = require('scientifclib.Imagens.Draw')
amarelo = Cor.new('RGB', 255, 0, 0)
im = Image.new(1000, 1000,25,25, Cor.white, 'RGB')
--print(amarelo)
--print(im)
--Draw.circle(im,Cor.blue,im.sh/2,im.sw/2,(im.sh+im.sw)/20,(im.sh+im.sw)/600)

local function f(x)
    return 3*math.exp(-math.abs((x)^2))
end
Draw.axis(im,Cor.black,0.02,-5,5,-5,5)

Draw.plot(im,
--[[cor]] Cor.cyan,
--[[espessura ]] 1,
--[[f(x) =  y]] f,
--[[xi limite]] -5,
--[[xi limite]] 5,
--[[yi limite]] -5,
--[[yi limite]] 5)


print(im:save("minhafototo", "ppm"))
os.execute('start '..im.saved)
