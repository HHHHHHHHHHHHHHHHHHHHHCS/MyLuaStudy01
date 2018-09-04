string1 = "Lua"
print("\"字符串 1 是\"",string1)
string2 = 'w3cschool.cn'
print("字符串 2 是",string2)

string3 = [["Lua 教程"]]
print("字符串 3 是",string3)

string4 = '"Lua String"'
print("字符串 4 是",string4)

str = "aAzZwW"
str=string.upper( str )
print(str)
str=string.lower( str )
print(str)
str=string.gsub( str,"a","t",1 )
print(str)

print(string.find("Lua Hello Lua user", "Lua", 5) ) 

str= string.reverse("Lua")
print(str)

print(string.format("the value is:%d",4))

print(string.char(97,98,99,100))

print(string.byte("ABCD",2))

print(string.len("abcasd"))

print(string.rep("abc", 3))