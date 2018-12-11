print("hook", "===================================")
function test1()
    c = nil
    a = 1
    b = a + 3
    print(b)
    print(c.x)
    return 1
end

function test2()
    c = {}
    table.insert(c, 1)
    print("table size is : " .. #c)
end

function line()
    print("line")
    --print(debug.traceback())
end
function call()
    print("call")
    --print(debug.traceback())
end
function ret()
    print("return")
    --print(debug.traceback())
end
debug.sethook(line, "l") --call:c return:r line:l
--debug.sethook(call,"c") --call:c return:r line:l
--debug.sethook(ret,"r") --call:c return:r line:l

test1()

print("profile", "===================================")

local Counters = {}
local Names = {}
local function hook()
    local f = debug.getinfo(2, "f").func
    local count = Counters[f]
    if count == nil then --"f"第一次被调用?
        Counters[f] = 1
        Names[f] = debug.getinfo(2, "Sn") --来源和名字
    else
        Counters[f] = count + 1
    end
end

local f = assert(loadfile(("fileName"))) --fileName 填写文件名字
debug.sethook(hook, "c")
f()
debug.sethook() --清空钩子

--获取一个函数的函数名
function getname(func)
    local n = Names[func]
    if n.what == "C" then
        return n.name
    end
    local lc = string.format("[%s]:%d", n.short_src, n.linedefined)
    if n.what ~= "main" and n.namewhat ~= "" then
        return string.format("%s (%s)", lc, n.name)
    else
        return lc
    end
end

--这会输出XX 方法被调用了多少次
for func, count in pairs(Counters) do
    print(getname(func), count)
end

print("sanbox", "===================================")

-- 内存检测方法一  通调用指令的数量 如果用for循环会检测失误
local debug = require("debug")

local stepLimit = 1000 --最大能够step指令的数量
local count = 0 --计数器
local function step()
    count = count + 1
    if count > stepLimit then
        error("script uses too much cpu")
    end
end

local f = assert(loadfile("fileName", "t", {})) --filename
debug.sethook(step, "", 100) --设置钩子 "",100 为每执行100次指令就调用一次钩子
f()

--内存检测方法二 同时检测内存 和step
local memLimit = 1000 --最大的内存 KB
local stepLimit = 1000 --最大能够执行的step指令数量

local function checkmem()
    if collectgarbage("count") > memLimit then
        error("script uses too much memory")
    end
end

local count = 0
local function step()
    checkmem()
    count = count + 1
    if count > stepLimit then
        error("script uses too much cpu")
    end
end

local f = assert(loadfile("fileName", "t", {})) --filename
debug.sethook(step, "", 100) --设置钩子 "",100 为每执行100次指令就调用一次钩子
f()

--内存检测方法三  拦截未授权的方法
local debug = require("debug")
local stepLimit = 1000 --最大能够执行的steps
local count = 0 --计数器
--设置授权的函数
local validfunc = {
    [string.upper] = true,
    [string.lower] = true
}

local function hook(event)
    if event == "call" then
        local info = debug.getinfo(2, "fn")
        if not validfunc[info.func] then
            error("calling bad  function:" .. (info.name or "?"))
        end
    end
    count = count + 1
    if count > stepLimit then
        error("scrtipts uses too much cpu")
    end
end

local f = assert(loadfile("fileName", "t", {})) --filename
debug.sethook(step, "", 100) --设置钩子 "",100 为每执行100次指令就调用一次钩子
f()