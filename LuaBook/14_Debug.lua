--assert(tonumber("e"),"error:no number")
local a1, a2 = assert(tonumber("123"), "error:no number")
print(a1, a2)
a1,a2=pcall(function (  )
    t=0/0
end)
pcall(
    function()
        print(2333)
    end
)

print(debug.getinfo(0))
print(debug.getinfo(1))
aa =function() return debug.traceback()end
print(aa())