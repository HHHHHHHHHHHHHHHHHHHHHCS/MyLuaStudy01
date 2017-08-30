a={23,12,3,21,23};
b={};


print(a);

print(a[10]);
print("=========================");

baseTable={"Lua","Java","C#","C++","Javascript"};
mymetaTable={};

setmetatable(baseTable,mymetaTable);

print(baseTable[3]);

print(getmetatable(baseTable));
print(baseTable);
print(mymetaTable);

newTable = setmetatable({"Lua","Java","C#","C++","Javascript"}
	,{1,2,3,4,5,6,7,8,9,10});


print("=========================");

--   使用 __metatable   可以保护元表
--  如果元表(metatable)中存在__metatable键值，setmetatable会失败 。
tab= setmetatable({"Lua","Java","C#","C++","Javascript"},{__metatable="ABCDEFG"});
print(getmetatable(tab));


print("=========================");


mymetaTable = 
{
	__index = 
	{
	[7]="Ruby",
	[8]="Python",
	function (tab,key)
		print("访问不存在的索引的时候 调用我:",tab,key);
	end
}
}

tab= setmetatable({"Lua","Java","C#","C++","Javascript"},mymetaTable);

print(tab[1]);
print(tab[8]);
print(tab[10]);