peoples={
    {name="a",age=1},
    {name="b",age=2},
    {name="c",age=3},
    {name="d",age=4},
    {name="e",age=5},
}

table.sort( peoples, function ( a,b )
    return a.age>b.age
end )

for k,v in pairs(peoples) do
    print(k,v.name,v.age)
end

function Cal()
    local a=0
    return function()
        a=a+1
        return a*a
    end
end

func=Cal()
print(func(),func(),func())

do
local fact

fact=function ( n )
    return n*n
end

print(fact(4))
end
print(fact)



do
    print(math.sin( 180 ))

    local oldSin=math.sin
    local k = math.pi/180
    math.sin=function (x )
        return oldSin(x*k)
    end

    print(math.sin( 90 ))
end

do
function T( x )
    return function ( a,b )
        return a*x+b*x
    end
end

t=T(3)
print(t(3,5),t(5,10))
end