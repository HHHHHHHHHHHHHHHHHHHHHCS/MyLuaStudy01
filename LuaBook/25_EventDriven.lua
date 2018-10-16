local cmdQueue = {}
local lib = {}

function lib.readline(stream, callback)
    local nextCmd = function()
        callback(stream:read())
    end
    table.insert(cmdQueue, nextCmd)
end

function lib.writelibne(stream, line, callback)
    local nextCmd = function()
        callback(stream:write((line)))
    end
    table.insert(cmdQueue, nextCmd)
end

function lib.stop()
    table.insert(cmdQueue, "stop")
end

function lib.runloop()
    while true do
        local nextCmd = table.remove(cmdQueue, 1)
        if nextCmd == "stop" then
            break
        else
            nextCmd()
        end
    end
end
--[[
print("---------------------------------------")

local t = {}
local inp = io.input()
local out = io.output()
local i

local function putline()
    i=i-1
    if i==0 then
        lib.stop()
    else
        lib.writeline(out,t[i].."\n",putline)
    end
end

local function getline(line)
    if line then 
        t[#t+1]=line
        lib.readline(inp,getline)
    else
        i=#t+1
        putline()
    end
end

lib.readline(inp,getline)
lib.runloop()
--]]
print("---------------------------------------")
function run(code)
    local co =
        coroutine.wrap(
        function()
            code()
            lib.stop()
        end
    )
    co()
    lib.runloop()
end

function putline(stream, line)
    local co = coroutine.running()
    local callback = (function()
        coroutine.resume(co)
    end)
    lib.writeline(stream, line, callback)
    coroutine.yield()
end

function getline(stream, line)
    local co = coroutine.running()
    local callback = (function(l)
        coroutine.resume(co, l)
    end)
    lib.readline(stream, callback)
    local line = coroutine.yield()
    return line
end

run(
    function()
        local t = {}
        local inp = io.input()
        local out = io.output()

        while true do
            local line = getline(inp)
            if not line then
                break
            end
            t[#t + 1] = line
        end

        for i = #t, 1, -1 do
            putline(out, t[i] .. "\n")
        end
    end
)
