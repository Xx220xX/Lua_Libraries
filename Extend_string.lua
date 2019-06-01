--[ transformar uma string em um array de char]--
string.toArrayInt = 
function (s)  
  local result ={} 
  for i=0,s:len(),1 do
    result[i]=s:byte(i) end return result 
end
--[ transformar um array de int em uma string]--
string.arrayToString = 
function (a,f) 
    local result =""    
    for i =1,#a,1 do
       if i>f then break end
          result= result.. string.char(a[i])
        end
     return result
 end
