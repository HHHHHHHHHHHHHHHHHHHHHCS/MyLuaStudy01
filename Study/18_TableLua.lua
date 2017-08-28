myTable = {};


myTable[1]="Lua";

myTable[1]=nil;

myTable=nil;

myTable={};

print(type(myTable));

myTable[1]="Lua";
myTable["name"]="小明";

newTable = myTable;
print(newTable);
print(myTable);

newTable[1]="C#";
print(newTable[1]);
print(myTable[1]);

myTable=nil;
print(newTable);
print(myTable);


print("======================================");


myTable={"Lua","C#","Java","C++","C"};

print(table.concat(myTable));
print(table.concat(myTable,"..."));
print(table.concat(myTable,',',2,4));

myTable[#myTable+1]="PHP";

table.insert(myTable,"Javascript");
print(table.concat(myTable,"."));

table.insert(myTable,2,"Ruby");
print(table.concat(myTable,"."));

table.remove(myTable);
print(table.concat(myTable,"."));

table.remove(myTable,2);
print(table.concat(myTable,"."));


tb = {"A-1",{"B-1","B-2",{"C-1"}},"A-2"}
--print(table.concat(myTable,".")); --ERROR