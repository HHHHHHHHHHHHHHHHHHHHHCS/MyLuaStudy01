

--[[
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
]]--

function TestFun(tab,fun)
	for k,v in pairs(tab) do
		fun(k,v);
	end
end

function F1 (k,v)
	print(k.."___________"..v);
end


function F2 (k,v)
	print(k.."==========="..v);
end

tab={key1="val1",key2="val2"};
TestFun(tab,F1);
TestFun(tab,F2);
TestFun(tab,function ( k,v)
	print(k.."♂"..v);
end);