days = {"Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"}
revDays = {["Sun"] = 1, ["Mon"] = 2, ["Tue"] = 3, ["Wed"] = 4, ["Thur"] = 5, ["Fri"] = 6, ["Sat"] = 7}

x = "Tue"
print(revDays[x])

newRevDays = {}
for k, v in pairs(days) do
    newRevDays[v] = k
end

for k, v in pairs(newRevDays) do
    print(k, v)
end

print("========================================")

reserved = {
    ["while"] = true,
    ["if"] = true,
    ["else"] = true,
    ["do"] = true
}

w = "true"

if not reserved[w] then
    print(w .. " is not key word")
end

function  Set( list )
    local set={}
    for _,l in ipairs(list) do
        set[l]=true
    end
    return  set
end

reserved=Set{"while","end","function","local"}

print("========================================")

function insert(bag,element)
    bag[element]=(bag[element] or 0)+1
end

function remove(bag,element)
    local count =bag[element]
    bag[element]=(count and count>1) and count - 1 or nil
end