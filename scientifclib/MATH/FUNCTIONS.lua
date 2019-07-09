--
-- Created by IntelliJ IDEA.
-- User: MORADIA082663
-- Date: 09/07/2019
-- Time: 11:54
-- To change this template use File | Settings | File Templates.
--

local FUCTION = {}
-- create('f','(x,y,z)','body','w') [[ f = function(x,y,z) body return w]]
FUCTION.create = function(name,params,body, result,table)
    table = table or _G
    local func,err = load("return function"..params..'\n  '.. body .. '\n  return '..result.."\n end")
    if func then
        local ok, add = pcall(func)
        if ok then
            table[name]= add
        else
            print("Execution error:" , add)
        end
    else
        print("Compilation error:", err)
    end

end

---[[ teste ok]]
-- FUCTION.create("g","(x,y)", "w = (x^2+y^2)^0.5","w")
return FUCTION
