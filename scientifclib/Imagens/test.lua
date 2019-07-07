--
-- Created by IntelliJ IDEA.
-- User: MORADIA082663
-- Date: 07/07/2019
-- Time: 09:34
-- To change this template use File | Settings | File Templates.
--

Image = require('Image')
Cor = require('Color')
amarelo = Cor.new('RGB',255, 0 ,0)
im = Image.new(10 ,10,amarelo,'RGB')
--print(amarelo)
--print(im)
im:pixel(im.sh/2,im.sw/2,Cor.new('rgb',0,255))

print(im:save("minhafototo","ppm"))
print(im.saved)


