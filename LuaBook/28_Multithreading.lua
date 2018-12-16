--协程实现多线程  需要luasocket 标准库

--普通的下载文件
local socket = require("socket")
host = "www.lua.org"
file = "/manuaal/5.3/manual.html"

c = assert(socket.connect(host, 80))

local request = string.format("GET %S HTTP/1.0\r\nhost:%s\r\n\r\n", file, host)
c:send(request)

repeat
    -- s是当前读取的出错时为null  partial是出错前读取的  如果出错则返回累积读取的
    local s, status, partial = c:receive(2 ^ 10) --2^10 1KB
    io.write(s or partial)
until status == "closed"

c:close()

print("下载web页面", "============================")

function download(host, file)
    local c = assert(socket.connect(host, 80))
    local count = 0 --计算读取的字节数
    local request = string.format("GET %S HTTP/1.0\r\nhost:%s\r\n\r\n", file, host)
    c:send(request)
    while true do
        local s, status = receive(c)
        count = count + #s
        if status == "closed" then
            break
        end
    end
    c:close()
    print(file, count)
end

function receive(connection)
    connection:settimeout(0) --不阻塞
    local s, status, partial = connection:receive(2 ^ 10)
    if status == "timeout" then
        coroutine.yield(connection)
    end
    return s or partial, status
end

print("调度器", "-------------------------------------")

task = {} --所有活跃任务的列表

function Get(host, file)
    --为任务创建协程
    local co =
        coroutine.wrap(
        function()
            download(hose, file)
        end
    )

    --插入活跃任务列表
    table.insert(tasks, co)
end

function Dispatch()
    local i = 1
    while true do
        if tasks[i] == nil then --当前任务做完要么到最后任务了
            if tasks[1] == nil then --列表为空?
                break --退出循环
            end
            i = 1 --继续执行循环
        end

        local res = tasks[i]()
        if not res then
            table.remove(tasks, i)
        else
            i = i + 1
        end
    end
end

Get("www.lua.org", "/ftp/lua-5.3.2.tar.gz")
Get("www.lua.org", "/ftp/lua-5.3.1.tar.gz")
Get("www.lua.org", "/ftp/lua-5.3.0.tar.gz")
Get("www.lua.org", "/ftp/lua-5.3.0.tar.gz")
Get("www.lua.org", "/ftp/lua-5.2.4.tar.gz")
Get("www.lua.org", "/ftp/lua-5.2.3.tar.gz")
Dispatch()

print("select调度器", "-----------------------------")

function Dispatch()
    local i = 1
    local timeout = {}
    while true do
        if tasks[i] == nil then
            if tasks[1] == nil then
                break
            end
            i = 1
            timeout = {}
        end

        local res = tasks[i]()
        if not res then
            table.remove(tasks, i)
        else
            i = i + 1
            timedout[#timedout + 1] = res
            if #timedout == #tasks then --所有任务都阻塞了?
                socket.select(timeout)
            end
        end
    end
end
