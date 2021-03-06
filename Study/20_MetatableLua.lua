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

-- 如果 使用 __index  访问不存在的索引的时候 调用
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

print("=========================");



-- __newindex  当我给表的 一个缺少索引的KEY 赋值的时候  触发事件而不进行赋值操作
-- 如果执意要赋值 用 rawset(table, key, value)
mytable = {"Lua","Java","C#","C++","Javascript"};
mymetaTable = 
{
	__newindex = function(tab,key,value )
	print("修改的Table:",tab,"修改的Key:"..key,"修改的Value:"..value);
	if(key==11) then
		rawset(tab, key, value)
	end
end

}

mytable=setmetatable(mytable,mymetaTable);

mytable[2]="Ruby";
mytable[10]="Scala";
print(mytable[10]);
mytable[11]="Python";
print(mytable[11]);

print("--------------------------");

--当然也可以 把不存在的索引 放在 新的表里面
mytable = {"Lua","Java","C#","C++","Javascript"};
newTable = {};
mymetaTable = 
{
	__newindex = newTable;
}

mytable=setmetatable(mytable,mymetaTable);

mytable[2]="Ruby";
print(newTable[2]);
mytable[10]="Scala";
print(newTable[10]);
mytable[11]="Python";
print(newTable[11]);

print("=========================");

-- __newindex  当我给表的 一个缺少索引的KEY 赋值的时候  触发事件而不进行赋值操作
-- 如果执意要赋值 用 rawset(table, key, value)
mytable = {"Lua","Java","C#","C++","Javascript"};
mymetaTable = 
{
	__add = function(tab,newtab )

	print("主表:",tab,"加表:",newtab);

	for k,v in pairs(newtab) do
		--tab[k]=v;
		table.insert(tab,v);
	end

	return tab;
end

}

newtab = {"PHP","C"};

mytable=setmetatable(mytable,mymetaTable);

v=mytable+newtab;
print(table.concat( v, " , " ));

print("-----------------------------------");

v2=newtab+mytable;
print(table.concat( v2, " , " ));

print("=========================");



mytable = {"Lua","Java","C#","C++","Javascript"};
mymetaTable = 
{
	__call = function(tab,arg1,arg2,arg3,arg3 )
	print("主表:",tab,"args:",arg1,arg2,arg3);
	return tab;
end
}

mytable = setmetatable(mytable,mymetaTable);
print(3333,2222,1111);


print("=========================");



mytable = {"Lua","Java","C#","C++","Javascript"};
mymetaTable = 
{
	__tostring = function(tab)
	local str = "";
for k,v in pairs(tab) do
	str=str..string.format("%s	%s\n",k,v);
end
	return str;
end
}

mytable = setmetatable(mytable,mymetaTable);
print(mytable);
