local  function Max(num1,num2)
	if(num1>num2) then
		return num1;
	else
		return num2
	end
end


print(Max(1,10));


MyPrint = function(param)
print("我要打印"..param);
end

MyPrint(1000);


function  Add(num1,num2,printFun )
	local res = num1+num2;
	printFun(res);
end

Add(40,50,MyPrint);

function  Temp()
	return 10,15,20,30;
end

res1,res2,res3,res4,res5=Temp();

print(res1,res2,res3,res4,res5);


print("x----------------------------x");

function Test( ... )
	local  arg = {...};
	for key,val in pairs(arg) do
		print(key,val);
	end
	print("==============");
end

Test();
Test(1);
Test(1,2);
Test(1,2,3);
Test(1,2,3,4,8);

print("x----------------------------x");

function NewTest( ... )
	local  myArg = {...};
	for key,val in pairs(myArg) do
		print(key,val);
	end
	print("==============");
end

NewTest();
NewTest(1);
NewTest(1,2);
NewTest(1,2,3);
NewTest(1,2,3,4,8);
