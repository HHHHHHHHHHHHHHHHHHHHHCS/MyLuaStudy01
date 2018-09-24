prototype={x=0,y=0,width=100,height=100,["_name"]="box"}

local mt={}
function new(o)
    o=o or {}
    setmetatable(o, mt)
    return o
end

mt.__index=function(_,key)
    return  prototype[key]
end

w=new{x=10,y=20}
print(w.width)

mt.__index=prototype
print(w["_name"])

mt.__newindex=function(tb,k,v)
    print(tb,k,v)
end

w["test"]="value"
rawset(w,"tk","tv")

print("=====================================")

function setDefault(t,d)
    t=t or {}
    local mt={__index=function ()
        return d
    end}
    setmetatable(t,mt)
end

tab={x=10,y=10}
print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)

print("=====================================")

mt={__index=function ( t,k,v )
    return t.___key
end}

function setDefault( t,d )
    t.___key=d
    setmetatable(t, mt)
end

tab={x=10,y=10}
print(tab.x,tab.z)
setDefault(tab,0)
print(tab.x,tab.z)

print("=====================================")

function readOnly( t )
    local proxy={}
    local mt={
        __index=t,
        __newindex=function ( t,k,v )
            error("can't add",2)
        end
    }

    setmetatable(proxy, mt)
    return proxy
end

days=readOnly{"1","2","3","4","5","6","7"}
print(days[1])
--days[1400]=1400--error: