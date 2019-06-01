--[ transformar uma string em um array de char]--
string.toArray = function (s)  
                    local result ={} 
                    for i=0,s:len(),1 do 
                       result[i]=s:sub(i,i) 
                    end 
                    return result 
                  end
--[ transformar um array de char em uma string]--
string.arrayToString = function (array,fim) 
                            local result =""    
                            for i =1,#array,1 do
                               if i>fim then break end
                                result= result.. array[i] 
                            end
                            return result
                        end
