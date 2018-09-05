function fact( n )
    if n==0 then
        return 1
    else 
        return n*fact(n-1)
    end
end
print("Enter Number:")
local a=io.read()
print(fact(a))

print(x or 5)
print(3>5 and 4 or 10)
print(arg[1])

io.write("asdasdsad")