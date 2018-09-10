package.path='E:/MyCPP/LuaDllTest02/x64/Debug/?.lua'  
package.cpath='E:/MyCPP/LuaDllTest02/x64/Debug/?.dll'     
local m= require "mylib"
 
a=25 b=15
print(a..":"..b)
c=m.sum(a,b)
print(c)
