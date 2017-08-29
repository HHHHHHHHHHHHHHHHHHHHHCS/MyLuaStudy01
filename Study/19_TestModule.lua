module = {};

module.name = "Yooooo";

module.TestFun = function ( ... )
	print("Hellow World");
end

function Fun1()
	print("public public public")
end

local function Fun2()
	print("local  local  local ")
end

--[[ error
local function module.Fun3()
	print("local local local")
end
--]]

local  number = 1;