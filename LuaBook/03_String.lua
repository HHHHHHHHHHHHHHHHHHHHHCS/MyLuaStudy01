a="one string"
b=string.gsub( a,"one","test" )
print(a,b)

c=[[
    'head'
    "body"
    \nfoot
    ground
]]
print(c)

print("10"+1.0)
print(tonumber("10101"),tonumber("10101",2))
print(tonumber("10")=="10",tostring(10)==10)

print("========================================")
print(string.rep( "abc", 3 ))
print(string.reverse( "Hello World" ))
print(string.lower( "Hello World" ))
print(string.upper( "Hello World" ))
print("abc"<"abd")

s="abcdefg"
print(string.sub(s,2,-2))
print(s:sub(2,-1))
print(string.sub(s,1,2))
print(string.sub(s,-2,-1))

print(string.char(97 ))
print(string.byte("abcdef",2 ))
print(string.byte("abcdef",2,-1 ))

print(string.byte( "asrd",1,-1 ))

print(string.format( "%d,%x,%f,%s",1,0x22,28.88,"test" ))

print(string.format( "(pi)=%.4f",math.pi ))
print(string.format( "%02d,%02d,%02d",5,11,2018 ))