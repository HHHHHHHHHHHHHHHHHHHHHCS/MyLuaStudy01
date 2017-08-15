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