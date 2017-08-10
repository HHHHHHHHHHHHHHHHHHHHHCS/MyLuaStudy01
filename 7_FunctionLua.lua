


function fact(n)
	if n==1 then
		return n;
	else
		return n*fact(n-1);
	end
end 

print(fact(1));

print(fact(3));

print(fact(5));


fact2 = fact;


print(fact(10));


--print(fact("ee"));