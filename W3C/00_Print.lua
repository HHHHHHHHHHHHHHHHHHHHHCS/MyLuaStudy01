function out( tab )
    local str="{"
    for k,v in pairs(tab) do
        str=str..k.."="..v..",";
    end
    str=str.."}"
    print(str)
    return  str
end