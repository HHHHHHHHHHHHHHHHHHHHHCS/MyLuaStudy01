array = {"Lua","C#","Java"};

for i=1,#array do
	print(array[i]);
end

array={};


for i = -5,5,2 do 
	array[i]=i*3;
end

for i=-5,5 do
	print(array[i]);
end

print("=========================");
for k,v in pairs(array) do
	print(k,v);
end

print("=========================");
for k,v in ipairs(array) do
	print(k,v);
end



print("--------------------------------------");

array={};


for i = 1,10,2 do 
	array[i]=i*3;
end

print("=========================");
for k,v in pairs(array) do
	print(k,v);
end

print("=========================");
for k,v in ipairs(array) do
	print(k,v);
end


for i = 1,10,1 do 
	array[i]=i*3;
end

print("=========================");
for k,v in pairs(array) do
	print(k,v);
end

print("=========================");
for k,v in ipairs(array) do
	print(k,v);
end

print("=========================");

array = {{"A—1","A-2","A-3"},{"B—1","B-2","B-3","B-4"},{"C-1","C-2"},{{"D-1-1","D-1-2"},{"D-2-1"}}};

for i=1,#array do
	for j=1,#array[i] do
		print(array[i][j])
	end
	print();
end