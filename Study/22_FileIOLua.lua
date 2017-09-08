--[[
file = io.open("Data.txt","r");

io.input(file);

print(io.read());--读取一行
print(io.read());--读取下一行
print(io.read());--读取下一行
print(io.read());--读取下一行
print(io.read());--读取下一行
print(io.read());--读取下一行
print(io.read());--读取下一行  中文注意编码
print(io.read());--读取下一行  nil 到末尾了

io.close(file);-- file:close();


print("=========================")

file = io.open("Data2.txt","r");

if(file~=nil) then
io.input(file);


print(file:read());--读取下一行
print(file:read());--读取下一行
print(file:read());--读取下一行
print(file:read());--读取下一行
print(file:read());--读取下一行
--如果读取中文可能出错

file:close();
end



print("=========================")

file = io.open("Data1.txt","w");

io.output(file);

io.write("www.baidu.com");

io.write("");

io.write("Test测试");

io.close(file);

print("=========================")

file = io.open("Data.txt","r");

io.input(file);

print(io.read("*a"));--读取全部


file:close();


print("=========================")
--]]

file = io.open("Data.txt","a");
print(file:write("qwer\nasdf\nzxcv"));
file:flush();
file:close();

print("=========================")

file = io.open("Data.txt","r");

print(file:read());
print("---------------")
print(file:read(2));--读取2个字符
print("---------------")
print(file:read(3));--读取3个字符
print("---------------")
print(file:read(60));--读取40个字符

file:close();


print("=========================")
