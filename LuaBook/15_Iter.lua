function values(t)
    local i = 0
    return function()
        i = i + 1
        return t[i]
    end
end

t = {10, 20, 30, 40}
iter = values(t)
while true do
    local element = iter()
    if element == nil then
        break
    end
    print(element)
end

for v in values(t) do
    print(v)
end

t = {"a", "b", "c", "d", "e"}
for k, v in next, t do
    print(k, v)
end

function getnext(list, node)
    if not node then
        return list
    else
        return node.next
    end
end

function traverse(list)
    return getnext, list, nil
end

for x, y, z in traverse(t) do
    print(x, y, z)
end

print("========================")

function pairsByKeys(t, f)
    local a = {}
    for n in pairs(t) do
        a[#a + 1] = n
    end
    table.sort(a, f)
    local i = 0
    return function()
        i = i + 1
        return a[i], t[a[i]]
    end
end

list={[5]="a5",[4]="b4",[3]="c3",[2]="d2",[1]="e1",[0]="f0",}

for name,line in pairsByKeys(list) do
    print(name,line)
end