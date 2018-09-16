s=string.pack("iii","2","3","4")
print(#s,s)

s=string.pack("zzz","2","3","4")
print(#s,s)


s=string.pack("i8","2","3","4")
print(#s,s)

a=string.unpack("i8",s)
print(a)

s=table.pack(1,2,3,54,5)
print(#s,s)
print(table.unpack(s))

str = "Hi,I am Lua"

for i=1,#str do
    ch=string.unpack( "B",str,i)
    print(string.format( "%02X",ch ) )
end
