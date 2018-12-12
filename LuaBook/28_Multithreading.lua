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
