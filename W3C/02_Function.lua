function GetMax(...) 
    local args = {...}
    local max=math.mininteger
    for _,v in pairs(args) do 
        if v>max then
            max=v
        end
    end
    print(max)
    return max
end

function Average(...)
    local result = 0
    local arg={...}
    for _,v in ipairs(arg) do
       result = result + v
    end
    print("总共传入 " .. #arg .. " 个数,".."Average:"..result/#arg)
    return result/#arg
 end

GetMax(1,23,43,34,63,6,6,7,7,8,56,56)
Average(1,23,43,34,63,6,6,7,7,8,56,56)

print(2^8)