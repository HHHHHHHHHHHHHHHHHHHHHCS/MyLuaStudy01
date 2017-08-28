array = {"Lua","Java","C#","C++"};

for k,v in pairs(array) do
	print(k,v)
end

print("=====================");

for i,v in ipairs(array) do
	print(i,v)
end

print("---------------------");

array[2]=nil;

for k,v in pairs(array) do
	print(k,v)
end

print("=====================");

for i,v in ipairs(array) do
	print(i,v)
end


print("---------------------");

array = {"Lua","Java","C#","C++"};
table.remove(array,2);

for k,v in pairs(array) do
	print(k,v)
end

print("=====================");

for i,v in ipairs(array) do
	print(i,v)
end


print("---------------------");


function  Square(max,now)
	if(now>=max) then
		return nil;
	else
		now = now+1;
		return now,now*now;
	end
end

for i,j in Square,9,0 do 
	print(i,j);
end
print("---------------------");
function elementIterator (collection)
   local index = 0
   local count = #collection
   -- 闭包函数
   return function ()
      index = index + 1
      if index <= count
      then
         --  返回迭代器的当前元素
         return collection[index]
      end
   end
end

for element in elementIterator(array)
do
   print(element)
end