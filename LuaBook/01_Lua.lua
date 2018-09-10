function fact( n )
    if n==0 then
        return 1
    else 
        return n*fact(n-1)
    end
end
print("Enter Number:")
local a=5--io.read()
--io.write("asdasdsad")
print(fact(a))

print(x or 5)
print(3>5 and 4 or 10)
print(arg[1])

print(1e5)
print(string.format( "%a,%a",419,0.1 ))

local pi = math.pi
print(pi-pi%0.001)

print("near",math.floor( 0.499+0.5 ))
print("near",math.floor( 0.1+0.5 ))
print("near",math.floor( 0.6+0.5 ))
print("near",math.floor( 3.5+0.5 ))
print("near",math.floor( 2.5+0.5 ))

print(1/7*7)

print(math.maxinteger+1.0==math.maxinteger+2.0)