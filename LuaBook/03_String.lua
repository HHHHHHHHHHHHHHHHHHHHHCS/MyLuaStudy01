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
print("========================================")

s="hello world"
print(string.find( s,"world"))
--print(string.find( "a [world]","[" ))--error
print(string.find( "a [world]","[",_,true ))

print(string.match( "hello wrold","hello"))
print(string.match( "Today is 17/07/1990","%d+/%d+/%d+"))

print(string.gsub( "Hi lua hi World  lua lua","lua","C++" ))
print(string.gsub( "Hi lua hi World  lua lua","lua","C++" ,2))
print("========================================")

s="some string word!!!"
words={}
for w in string.gmatch( s,"%a+" ) do
words[#words+1]=w
end
for _,v in pairs(words) do 
    print( v)
end

print(string.match( "name = Anna","(%a+)%s*=%s*(%a+)" ))
print(string.match( "Today is 17/07/1990","(%d+)/(%d+)/(%d+)"))
print(string.gsub( "Hi lua hi World  lua lua","%a","%0-%0" ))
print(string.gsub( "Hi lua hi World  lua lua","(.)(.)","%2%1" ))

s=[[then he said:"it's all right"]]
 print(string.match( s,"([\"'])(.-)%1"))