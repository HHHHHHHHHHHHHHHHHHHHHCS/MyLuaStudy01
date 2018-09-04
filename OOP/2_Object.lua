Cal={1,2,3,4,5,6,7}

function Cal:New(o)
    o=o or {}
    setmetatable(o, self)
    self.__index=self
    return  o;
end


local o = Cal:New()

print(o[3])

function Cal:Add(a,b)
    return a+b
end

print(o:Add(3,5))


function o:Add(a,b)
    return (a+b)*(a-b)
end

print(o:Add(5,3))