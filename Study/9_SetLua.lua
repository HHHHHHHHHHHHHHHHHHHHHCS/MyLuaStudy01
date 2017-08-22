a,b,c=10,2.1,"Hi";


print(a,b,c);

a,b=b,a;

print(a,b,c);

a,b=10,2.1,"Hi";

print(a,b);

a,b,c=10,2.1;

print(a,b,c);


function  Test()
	return "吃饭","睡觉","呵呵";
end

a,b=Test();
print(a,b);