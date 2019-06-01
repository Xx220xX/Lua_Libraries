string.toArray = function (s)  local result ={} for i=0,s:len(),1 do result[i]=s:sub(i,i) end return result end
