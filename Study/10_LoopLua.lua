a=1;
while(a<=20) do
	if(a%2==1)then
		print(a);
	end
	a=a+1;
end

print("----------------");

for i=1,10,2 do
	print(i);
end

print("----------------");

for i=20,1,-2 do
	print(i);
end

print("----------------");

tab1={k1="v1",k2="v2",k3="v3"};

for k,v in pairs(tab1) do
	print(k,v);
end

print("----------------");


tab2={"v1","v2","v3","v4"};

for k,v in pairs(tab2) do
	print(k,v);
end

print("----------------");

i=1;

repeat 
	print(i);
	i=i+1;
until(i>100)


print("----------------");

for i=1,10 do
	for j=1,i  do
		print(i,j);
	end
end