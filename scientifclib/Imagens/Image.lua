--[[
 ## english
 Some useful functions for manipulating images

 ? new (height, width, color pattern)
        this function creates an array and returns a table containing this information
        the matrix starts at position 1
 ? is_Image (v)
        verifies whether 'v' is an image
 ? tostring (v)
        moves the image to string showing only the characteristics
 ? pixel (t, i, j, color)
        changes the color of the matrix of the image in position i, j
 ? save (t, name, format)
        save the image with the specified name and format
        support so far for ppm

 ###################### portuguese#################
 Algumas funcoes uteis para manipulacao de imagens

 ? new(altura, largura, padrao de cores)
        essa funcao cria uma matriz e retorna uma tabela contendo essas informacoes
        a matriz comeca na posicao 1
 ? is_Imagem(v)
        verifica se 'v' é uma imagem
 ? tostring(v)
        passa a imagem para string mostrando apenas aas caracteristicas
 ? pixel(t,i,j,cor)
        muda a cor da matriz da imagem na posicao i,j
 ? save(t, name, format)
        salva a imagem com o nome e formato especificado
        suporte ate agora para :ppm


]] --
local floor = math.floor
local Cor = require('Color')
local Image = {}
Image.__index = Image

Image.new = function(altura_px, largura_px,altura_cm,largura_cm, backgroundColor, tipoDecor)
    local mat = {}

    for ii = 1, altura_px do
        mat[ii] = {}
        for jj = 1, largura_px do
            mat[ii][jj] = backgroundColor
        end
    end
    return setmetatable({ m = mat, sh = altura_px, sw = largura_px ,ddp=altura_px/altura_cm*largura_px/largura_cm, typeColor = tipoDecor or "UNDEFINED" }, Image)
end
Image.is_image = function(v)
    return getmetatable(v) == Image
end

Image.__tostring = function(im)
    return string.format("size %d %d, typeColor  ", im.sh, im.sw) .. im.typeColor
end

Image.pixel = function(t, i, j, cor)
    i = floor(i)
    j = floor(j)
    t.m[i][j] = cor
end
local function saveasppm(t, name)
    name = name .. '.ppm'
    local file = io.open(name, 'w')

    if file == nil then return "falha na abertura do arquivo" end
    t.saved = name
    file:write("P3\n" .. t.sw .. " " .. t.sh, ' 255\n')
    for ii = 1, t.sh do
        for jj = 1, t.sw do
            if (t.m[ii][jj] == nil) then t.m[i][j] = { r = 0, g = 0, b = 0 } end
            if (jj)%500==0 then file:write('\n') end
            file:write(string.format('% 3d % 3d % 3d ',
                t.m[ii][jj].r, t.m[ii][jj].g,
                t.m[ii][jj].b))
        end
        file:write('\n')
    end
    file:close(file)
    return "Sucesso"
end

Image.save = function(t, name, format)

    if format == "ppm" then
        return saveasppm(t, name)
    end
    return "ERRO:formato desconhecido"
end

return Image
