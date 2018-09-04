require("W3C/00_Print")

function f(x)  
    print("function:"..x)  
    return x*2   
end  

local t=10

for i=1,f(t),1 do 
    print(i)  
end 

print("======================")

days = {[0]="Suanday",[1]="Monday",[2]="Tuesday",[3]="Wednesday",[5]="Thursday",[33]="Friday",[9]="Saturday"}
out(days)

print("--------------------")
for k,v in ipairs(days) do
    print(k,v)
end

print("======================")

x=20
repeat
    print(x)
until(x>15)

print("======================")

for  x=0,3,1 do
    print("x:"..x)
    for y=x,0,-1 do
        print("y:"..y)
    end

end

print("======================")


array = {"Lua", "Tutorial","A","B","C","zzzz"}

function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 2
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array) do
   print(element)
end
