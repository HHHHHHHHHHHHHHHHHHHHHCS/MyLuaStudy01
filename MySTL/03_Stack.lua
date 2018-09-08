Stack={}

--创建新的栈
function Stack:New( ... )
    local temp={}
    setmetatable(temp, Stack)
    self.__index=self

    temp.stack={}
    temp.count=0

    args={...}
    for k,v in pairs(args) do
        temp:Push(v)
    end
    return temp
end

--清除栈
function Stack:Clear(  )
   self.stack={}
   self.count=0
end

--删除并且返回栈首
function Stack:Pop(  )
    local temp = self.stack[self.count]
    table.remove( self.stack, self.count )
    self.count=self.count-1
    return temp
end

--压入一个变量到栈
function Stack:Push( arg )
    table.insert( self.stack, arg )
    self.count=self.count+1
end

--返回栈首
function Stack:Peek(  )
    return self.stack[self.count]
end

--统计总数
function Stack:Count(  )
    return self.count
end

--输出
function Stack:Print()
    for i=self.count,1,-1 do 
        print(self.count-i+1,self.stack[i])
    end
end

stack=Stack:New(12,3,4,4,55,6)
print(stack:Peek(),stack:Count())
print("=================================")

stack:Pop()
stack:Push(1000)
stack:Print()
print("=================================")

stack:Clear()
stack:Print()
print(stack:Count())
print("=================================")