--
-- Created by IntelliJ IDEA.
-- User: MORADIA082663
-- Date: 07/07/2019
-- Time: 09:34
-- To change this template use File | Settings | File Templates.
--

Image = require('Image')
Cor = require('Color')
Draw = require('Draw')
amarelo = Cor.new('RGB', 255, 0, 0)
im = Image.new(600, 600, Cor.white, 'RGB')
--print(amarelo)
--print(im)

Draw.circle(im,Cor.blue,im.sh/2,im.sw/2,(im.sh+im.sw)/20,(im.sh+im.sw)/600)
--Draw.FUNCTION_X(im,Cor.cyan,(im.sh+im.sw)/600,math.sin,im.sw/2,im.sh/2,0.1,0.1)


print(im:save("minhafototo", "ppm"))
print(im.saved)


