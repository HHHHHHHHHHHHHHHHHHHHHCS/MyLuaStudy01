for n in pairs(_G) do
    print(n)
end

print("=================")

function getfield(f)
    local v = _G
    for w in string.gmatch(f, "[%a_][%w_]*") do
        if v ~= nil and type(v) == "table" then
            v = v[w]
        else
            return nil
        end
    end
    return v
end

function setfield(f, v)
    local t = _G
    for w, d in string.gmatch(f, "([%a_][%w_]*)(%.?)") do
        if d == "." then
            t[w] = t[w] or {}
            t = t[w]
        else
            t[w] = v
        end
    end
end

getfield("a.b.c.d")
setfield("a.b.c.d.e", 10)
print(getfield("a.b.c.d.e"))
print("========================")

local  function declare( name,initval )
    rawset(_G,name,initval or false)
end

local function get( name,initval )
    rawget(_G,initval)
end

local declaredNames={}

setmetatable(
    _G,
    {
        __newindex = function(t,n,v)
            if not declaredNames[n] then
                local w=debug.getinfo( 2,"S" ).what--2:栈层  S:仅返回 what:Lua
                if w~="main" and w~="C" then
                    error("attempt to write to undeclared variable "..n,2)
                end
                declaredNames[n]=true
            end
            rawset(t,n,v)
        end,

        __index = function(_, n)
            if not declaredNames[n] then
                error("attempt to read undeclared variable "..n,2)
            else 
                return nil
            end
        end
    }
)


--print(z)--error:
mm={}--

