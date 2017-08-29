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

print("======================================");

print(table.concat(myTable,','));

table.sort( myTable);

print(table.concat(myTable,','));


sortTable = {1,3,5,7,9,2,4,6,8,10};

table.sort(sortTable);

print(table.concat(sortTable,','));


maxnTable1 = {k1="2",k2="3",k3="4",k4="5",k5="6",k6="7",k7="8",k8="9",k9="10"};
maxnTable2 = {[1]="2",[2]="3",[3]="4",[4]="5",[5]="6",[6]="7",[7]="8",[8]="9",[9]="10"};
--[[ 功能table.maxn是过时的。把它写在Lua，如果你真的需要它。
print(table.maxn(maxnTable2));
--]]
-- 可以手写下面方法代替  maxn
function  GetMaxNumber( newTable )
	local  mn = 0;
	for k,v in pairs(newTable) do
		if(mn<k) then
			mn=k;
		end
	end
	return mn;
end
--print(GetMaxNumber(maxnTable1));  --error 不能是 STRING
print(GetMaxNumber(maxnTable2));