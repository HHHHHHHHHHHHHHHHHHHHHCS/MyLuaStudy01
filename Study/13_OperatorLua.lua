a=10.0;
b=20;
c=2;
d=2.4;

print(a/b);
print(b/c);
print(d%c);
e=0.4;
f=.3;
print(e%f);

g=2;
h=10;
print(g^h);

print(-g);


if(1==1)then
	print(true);
end

if(1~=2)then

	print(false);
end

if(1<2)then
	print("<");
end

if(1<=2)then
	print("<=");
end

if(true and true) then
	print(true);
end

if(true or false) then
	print(true);
end

if(not false) then
	print(true);
end


print("-----------------------------")

tab = {1,2,3,4,5,6,7,8,9,10};

print(#tab);
tab=nil;
tab={k1="1",k2="2",k3="3"};
tab.k4="4";
tab.k5=5;
print(#tab);

tab=nil;
tab = {1,2,3,4,5,6,7,8,9,10};
tab[3]=nil;
print(#tab);
print("-----------------------------")
for val in pairs(tab) do
	print(val);
end
print("-----------------------------")
table.remove(tab,3);
print(#tab);


