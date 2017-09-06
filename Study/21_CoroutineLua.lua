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