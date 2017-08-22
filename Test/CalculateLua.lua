mytable = {1,3,5,7,9}                          -- 普通表 
mymetatable = {2,4,6,8,10}                      -- 元表


print("metatable:=============================================");
tb = getmetatable(mytable);
if(tb~=nil)then
	for k,v in pairs(tb) do
		print(v);
	end
else 
	print("METABLE IS NIL")
end


print("one table:=============================================");
newtb = setmetatable(mytable,mymetatable)     -- 把 mymetatable 设为 mytable 的元表 
for k,v in pairs(mytable) do
	print(v);
end


print("two table:=============================================");
for k,v in pairs(mymetatable) do
	print(v);
end

print("new table:=============================================");

for k,v in pairs(newtb) do
	print(v);
end

print("getmetatable:=============================================");
tb = getmetatable(mytable);
for k,v in pairs(tb) do
	print(v);
end

print("=============================================");




function Add(...)
	local args = {...};
	for k,v in pairs(args) do
		print(k,v);
	end
end

Add(2,4,8,16,32,64,128,256,512);

print("=============================================");






