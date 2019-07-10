
sci = require('scientifclib.MATH.mathSci')
i = sci.complex.i

function test(s,f,...)
    print("test "..tostring(f), s.."   ".. f(...))
end
test("log",sci.log,i)           --
test("log10",sci.log10,i)       --
test("exp",sci.exp,i)           --
test("srqt",sci.sqrt,-1)        --
test("sin",sci.sin,i)           --
test("cos",sci.cos,i)           --
test("tan",sci.tan,i)           --
test("asin",sci.asin,i)         --
test("acos",sci.acos,i)         --
test("atan",sci.atan,(i))       -- failed to z = i
test("sinh",sci.sinh,(i))       --
test("cosh",sci.cosh,(i))       --
test("tanh",sci.tanh,(i))       --
test("asinh",sci.asinh,(i))   -- failed to z = i
test("acosh",sci.acosh,(i))     --
test("atanh",sci.atanh,(i))     --



