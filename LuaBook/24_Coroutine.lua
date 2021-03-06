co =
    coroutine.create(
    function()
        print("hi")
    end
)
print(type(co))
print(coroutine.status(co))
print(coroutine.resume(co))
print(coroutine.status(co))
print("=============================")
co =
    coroutine.create(
    function()
        for i = 1, 10 do
            print("co", i)
            coroutine.yield()
        end
    end
)

coroutine.resume(co)
print(coroutine.status(co))
for i = 2, 10 do
    coroutine.resume(co)
    print(coroutine.status(co))
end
coroutine.resume(co)
print("=============================")
co =
    coroutine.create(
    function(a, b, c)
        print("co", a, b, c + 2)
    end
)
coroutine.resume(co, 1, 2, 3)
print("=============================")
co =
    coroutine.create(
    function(a, b)
        coroutine.yield(a + b, a - b)
    end
)
print(coroutine.resume(co, 20, 10))
print("=============================")
co =
    coroutine.create(
    function(x)
        print("co1", x)
        print("co2", coroutine.yield())
        return 6, 7
    end
)

coroutine.resume(co, "hi")
coroutine.resume(co, 4, 5)
print(coroutine.resume(co))
co =
    coroutine.create(
    function()
        return 6, 7
    end
)
print(coroutine.resume(co))
print("=============================")
function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end

function send(x)
    coroutine.yield(x)
end

function producer()
    return coroutine.create(
        function()
            while true do
                local x = io.read()
                send(x)
            end
        end
    )
end

function filter(prod)
    return coroutine.create(
        function()
            for line = 1, math.huge do
                local x = receive(prod)
                x = string.format("%5d %s", line, x)
                send(x)
            end
        end
    )
end

function consumer(prod)
    while true do
        local x = receive(prod)
        io.write(x, "\n")
    end
end
print("=============================")
function permgen(a, n)
    n = n or #a
    if n <= 1 then
        coroutine.yield(a)
    else
        for i = 1, n do
            a[n], a[i] = a[i], a[n]

            permgen(a, n - 1)

            a[n], a[i] = a[i], a[n]
        end
    end
end

function printResult(a)
    for i = 1, #a do
        io.write(a[i], " ")
    end
    io.write("\n")
end

function permutations(a)
    --[[
    local co =
        coroutine.create(
        function()
            permgen(a)
        end
    )
    return function()
        local code, res = coroutine.resume(co)
        return res
    end
    --]]
    return coroutine.wrap(
        function()
            permgen(a)
        end
    )
end

for p in permutations {"a", "b", "c"} do
    printResult(p)
end
