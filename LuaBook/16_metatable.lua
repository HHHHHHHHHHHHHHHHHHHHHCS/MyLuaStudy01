t = {}
print(getmetatable(t))

t1 = {}
setmetatable(t, t1)
print(getmetatable(t), t1)

print(getmetatable("biji"))
print(getmetatable("hi llo"))
print(getmetatable(10))
print(getmetatable(print))

print("==============================")

local Set = {}
local mt = {}

function Set.new(l)
    local set = {}
    setmetatable(set, mt)
    for _, v in ipairs(l) do
        set[v] = true
    end
    return set
end

function Set.union(a, b)
    if getmetatable(a) ~= mt or getmetatable(b) ~= mt then
        error("attempt to 'add' a set with a non-set value", 2)
    end

    local res = Set.new {}
    for k in pairs(a) do
        res[k] = true
    end
    for k in pairs(b) do
        res[k] = true
    end
    return res
end

function Set.intersection(a, b)
    local res = Set.new {}
    for k in pairs(a) do
        res[k] = b[k]
    end
    return res
end

function Set.tostring(set)
    local l = {}
    for e in pairs(set) do
        l[#l + 1] = tostring(e)
    end
    return "{" .. table.concat(l, ", ") .. "}"
end

s1 = Set.new {10, 20, 30, 50}
s2 = Set.new {30, 1}
print(getmetatable(s1))
print(getmetatable(s2))

mt.__add = Set.union
s3 = s1 + s2
print(Set.tostring(s3))

mt.__mul = Set.intersection
s3 = (s1 + s2) * s1
print(Set.tostring(s3))

--s3=s1+8--error:

mt.__le = function(a, b) --子集
    for k in pairs(a) do
        if not b[k] then
            return false
        end
    end
    return true
end

mt.__lt = function(a, b) --真子集
    return a <= b and (not( b <= a))
end

mt.__eq = function(a, b)
    return a <= b and b <= a
end

s1 = Set.new {2, 4}
s2 = Set.new {4, 10, 2}

print(s1 <= s2)
print(s1 < s2)
print(s1 >= s2)
print(s1 <= s2)
print(s1 > s1)
print(s1 == s1 * s2)
