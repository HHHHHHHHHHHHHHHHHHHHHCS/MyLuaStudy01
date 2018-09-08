Queue={}

--新建一个
function Queue:New( ... )
    local temp={}
    setmetatable(temp, Queue)
    self.__index=self

    temp.queue={}
    temp.count=0

    args={...}
    for k,v in pairs(args) do
        temp:EnQueue(v)
    end
    return temp
end

--清除
function Queue:Clear(  )
   self.queue={}
   self.count=0
end

--删除并且返回队列首
function Queue:DeQueue(  )
    local temp = self.queue[1]
    table.remove( self.queue, 1 )
    self.count=self.count-1
    return temp
end

--压入一个变量在队列
function Queue:EnQueue( arg )
    table.insert( self.queue, arg )
    self.count=self.count+1
end

--返回队列首
function Queue:Peek(  )
    return self.queue[1]
end

--返回总数
function Queue:Count(  )
    return self.count
end

--输出
function Queue:Print()
    for k,v in pairs(self.queue) do 
        print(k,v)
    end
end

queue=Queue:New(12,3,4,4,55,6)
print(queue:Peek(),queue:Count())
print("=================================")

queue:EnQueue(5)
queue:DeQueue()
queue:Print()
print("=================================")

queue:Clear()
queue:Print()
print(queue:Count())
print("=================================")