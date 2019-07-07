local Imagem={}
Imagem.__index=Imagem

Imagem.new=function (altura,largura,tipoDecor)
local mat ={}

for ii=1,altura do
    mat[ii]={}
end
 return setmetatable({m=mat,sh=altura,sw=largura,typeColor=tipodeCor},Imagem)
end
local function is_Imagem(v)
   return getmetatable(v)==Imagem
end
local function tostring(im)
  return string.format("size %d %d the matriz was defined? ",im.sh,im.sw)..(im.m~=nil and "true"or "false")
end
Imagem.__tostring=tostring
Imagem.setValue=function(t,i,j,cor)
       t.m[i][j] = cor
end
local function saveasppm(t,name)
    name =name..'.ppm'
   local file = io.open(name,'w')
  --print(file)
 if file==nil then return "falha na abertura do arquivo" end
   t.saved=name..'ppm'
   file.write("P3\n".. t.sw,t.sh,'255\n')
   for ii=1,t.sh do
      for jj=1,t.sw do
         if(t.m[ii][jj].r==nil) then t.m[i][j]={r=0,g=0,b=0} end
          file:write(string.format('%d %d %d ',
          	t.m[ii][jj].r
          	,t.m[ii][jj].g,
          	t.m[ii][jj].b))
      end 
       file:write('\n')
    end   
   file:close(file)
   return "Sucesso"
end
Imagem.save= function(t,name,format)

   if format== "ppm" then 
   return saveasppm(t,name)
   end
return "ERRO:formato desconhecido"
end

return Image

