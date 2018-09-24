function  track( t )
    t=t or {}

    local proxy={}

    local mt={
        __index=function(_,k)
            print("access to element"..tostring(k))
            return t[k]
        end,

        __newindex=function(_,k,v)
            print("update to element"..tostring(k).."to"..tostring(v))
            t[k]=v
        end,

        __pairs=function()
            return function(_,k)
                print("key "..tostring(k))
                local nextkey,nxetvalue = next(t,k)
                if nextkey ~=nil then--避免最后一个值
                    print("*traversing element"..tostring(nextkey)) 
                end
                return nextkey,nxetvalue
            end
        end,

        __len=function() return #t end
    }

    setmetatable(proxy, mt)

    return proxy
end


t=track()
t[2]="hello"

print(t[2])

t=track{10,20,30}
print(#t)

for k,v in pairs(t) do
    print(k,v)
end
