s,e=string.find("Hi Lua lll","Lua")
print(s,e)

function foo3(  )
    return 1,2,3
end

x,y=foo3(),100
print(x,y)

x,y,z,w=foo3()
print(x,y,z,w)

function foo( ... )
    local a,b,c=...
    return a+b+c
end
print(foo(1,2,3,4,5,6,7))

print(select(2, 1,2,3,4,5,6))
print(select("#", 1,2,3,4,5,6))

local tb=table.pack(1,2,3,4,5,nil,nil,6,7,8,nil,9)
for i=1,tb.n do
    print(i,tb[i])
end

a,b,c=table.unpack({10,20,30,40,50,60})
print(a,b,c)

print(table.unpack({1,2,3,4,5,6,7,8,9},2,5))