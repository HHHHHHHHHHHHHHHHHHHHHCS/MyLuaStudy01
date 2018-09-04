Class={}

Class.list={}

Class.new=function(t)
    local res={}
    setmetatable(res, Class.list)
    for _,v in pairs(t) do
        table.insert( res,v )
    end
    return res
end

Class.union=function(a,b)
    local res=Class.new{}
    for _,v in pairs(a) do

        table.insert( res, v )
    end
    for _,v in pairs(b) do
        table.insert( res, v )
    end
    return res
end

Class.list.__add=Class.union

Class.print=function(t)
    local str="{"
    for _,v in pairs(t) do
        str=str..v..","
    end
    str=str.."}"
    print(str)
end

local c1 = Class.new{1,2,3,4}
local c2 = Class.new{4,5,6,7,8}

local c3 = c1+c2

Class.print(c3)
