a = {}
mt = {__mode = "k"}
setmetatable(a, mt)
key = {}
a[key] = 1
key = {}
a[key] = 2
collectgarbage()
for k, v in pairs(a) do
    print(v)
end
print("======================")
local results = {}
setmetatable(results, {__mode = "kv"})
function mem_loadstring(s)
    local res = results[s]
    if res == nil then
        res = assert(load(s))
        results[s] = res
    end
    return res
end
print("======================")
local results = {}
setmetatable(results, {__mode = "v"})
function CreateRGB(r, g, b)
    local key = string.format("%d-%d-%d", r, g, b)
    local color = results[key]
    if color == nil then
        color = {red = r, green = g, blue = b}
        results[key] = color
    end
    return color
end
print("======================")
local defaults = {}
setmetatable(defaults, {__mode = "k"})
local mt = {
    __index = function(t)
        return defaults[t]
    end
}
function SetDefault(t, d)
    defaults[t] = d
    setmetatable(t, mt)
end

print("======================")
local metas = {}
setmetatable(metas, {__mode = "v"})
function SetDefault(t, d)
    local mt = metas[d]
    if mt == nil then
        mt = {
            __index = function()
                return d
            end
        }
        metas[d] = mt
    end
    setmetatable(t, mt)
end
print("======================")
local mem = {}
setmetatable(mem, {__mode = "k"})
function factory(o)
    local res = mem[o]
    if not res then
        res = (function()
            return o
        end)
        mem[o] = res
    end
    return res
end
