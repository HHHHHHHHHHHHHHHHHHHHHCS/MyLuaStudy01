function traceback()
    for level = 1, math.huge do
        local info = debug.getinfo(level, "Sl")
        if not info then
            break
        end
        if info.what == "C" then
            print(string.format("%d\tC function", level))
        else
            print(string.format("%d\t[%s]:%d", level, info.short_src, info.currentline))
        end
    end
    print(debug.traceback())
end

traceback()

print("=====================================")
function foo(a, b)
    local x
    do
        local c = a - b
    end
    local a = 1
    while true do
        local name, value = debug.getlocal(1, a)
        if not name then
            break
        end
        print(name, value)
        a = a + 1
    end
end

foo(10, 20)
