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
