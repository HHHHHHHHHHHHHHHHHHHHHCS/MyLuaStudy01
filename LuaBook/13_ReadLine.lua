--最慢的
--每次字符串拼接lua可能会生成新的字符串
local buff=""
for line in io.lines() do
    buff=buff..line.."\n"
end
print(buff)
print("===============================")

--比上面快很多

local t={}
for line in io.lines() do
    t[#t+1]=line.."\n"
end
local s= table.concat( t)
print(s)
print("===============================")


local t={}
for line in io.lines() do
    t[#t+1]=line
end
t[#t+1]=""--加入空字符串 方便换行
s=table.concat( t,"\n" )
print(s)
