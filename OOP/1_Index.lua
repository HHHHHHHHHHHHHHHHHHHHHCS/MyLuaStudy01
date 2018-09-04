original = {} --原始表

mt = {}

mt.__index = function (t, k) --此表的访问操作，都会访问original表
    print("access table element " .. tostring(k) .. " : " .. tostring(original[k]))
    return original[k]
end

mt.__newindex = function (t, k, v) --此表的赋值操作，都会操作original表
    print("update table element " .. tostring(k) .. " : " .. tostring(original[k]) .. " to " .. tostring(v))
    original[k] = v
end

t = {} --监控表 用来监控original

setmetatable(t, mt)
t[1] = "hello"            --update table element 1 : nil to hello
str = t[1] .. "world"    --access table element 1 : hello
print(str)                --helloworld