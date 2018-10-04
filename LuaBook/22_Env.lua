--[[

local print,sin=print,math.sin

--_ENV=nil

print(13)
print(sin(13))
--print(math.sin( 13 ))--error

a=13 
local a =12
print(a)
print(_ENV.a)
print(_G.a)

--_ENV={}
print(_ENV.a)

print("========================")

a=15
_ENV={_G=_G}
a=1
_G.print(_ENV.a,_G.a)

print("========================")


a=1
local newgt={}
_G.setmetatable(newgt, {__index=_G})
_ENV=newgt
print(a)

a=10
print(a,_G.a)
_G.a=20
print(a,_ENV.a,_G.a)

print("========================")


_ENV={_G=_G}
local function foo()
    _G.print(a)
end
a=10
foo()
_G={_G=_G,a=20}

print(a)
foo()
a=15
print(a)
foo()
print("====================")
--]]




a=2
do 
    local _ENV={print=print,a=99}
    print(a)
end
print(a)
print("====================")

f=load("b=10;return a")
env={a=200}
debug.setupvalue( f, 1, ebv )
print(f())
print(env.b)