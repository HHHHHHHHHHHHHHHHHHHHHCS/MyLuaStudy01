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