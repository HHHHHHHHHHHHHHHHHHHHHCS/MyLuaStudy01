co = coroutine.create
(
	function ( ... )
		local args = {...};
		local result = 0;
		for v in pairs(args) do
			result=result+v;
		end
		print(result);
	end
	);


coroutine.resume(co,1,2,3,4,5);

print("============================");

co= coroutine.wrap(
	function ( ... )
		local args = {...};
		local result = 1;
		for v in pairs(args) do
			result=result*v;
		end
		print(result);
	end
	)


co(1,2,3,4,5,6,7,8,9);

print("============================");


co=coroutine.create(
	function ( a,b )
		print(a+b);	
		print(a*b);
		coroutine.yield();
		print(a-b);
		return a/b,a%b;
	end
	)
print(coroutine.status(co));
print(coroutine.running());

res1,res2,res3 = coroutine.resume(co,20,30);
print(res1,res2,res3);
print(coroutine.status(co));
print(coroutine.running());

print("Pause");

res1,res2,res3 = coroutine.resume(co);
print(res1,res2,res3);
print(coroutine.status(co));
print(coroutine.running());

print("============================");

res1,res2 = coroutine.resume(co);
print(res1,res2);

print("============================");


function Test(a )
	print("Test",a);
	return coroutine.yield(a*a);
end

co = coroutine.create(
	function ( a,b )
		print("First",a,b);
		local r =Test(a);


		print("Second",r);
		local r,s = coroutine.yield(a+b,a-b);

		print("Third",r,s);
		return b;
	end
	)

print(coroutine.resume(co,2,10));
print(coroutine.resume(co,1));
print(coroutine.resume(co,10,-2));
print(coroutine.resume(co,5));