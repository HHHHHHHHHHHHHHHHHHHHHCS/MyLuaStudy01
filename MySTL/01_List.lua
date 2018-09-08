ListNode={}
List={}

--列表的节点结构体
function ListNode:New(val,last,next)
    local temp={}
    setmetatable(temp, ListNode)
    self.__index=self
    temp.val=val
    temp.last=last
    temp.next=next
    return temp
end

--列表的类型
function List:New(...)
    local temp={}
    setmetatable(temp, List)
    self.__index=self

    temp.count=0

    local args={...}
    if #args~=0 then
        for _,v in pairs(args) do
            temp:Add(v)
        end
    end
    return temp
end

--列表的count加一
function List:CountPlusOne()
    self.count=self.count+1
end

--列表的count减一
function List:CountReduceOne()
    self.count=self.count-1
end

--检查是否越界
function List:CheckRange( index )
    if index>self.count or index<0 then 
        print(self,index,self.count,"is outRange")
        return false
    else
        return true
    end
end

--列表直接添加到末尾
function List:Add(arg)
    local node
    if self.start==nil then
        node=ListNode:New(arg,nil,nil)
        self.start=node
        self.finish=node
    else 
        node=ListNode:New(arg,self.finish,nil)
        self.finish.next=node
        self.finish=node
    end
    self:CountPlusOne()
    return node
end

--列表的遍历
function List:For()
    local index=-1 
    local now
    return function()
        index=index+1
        if index < self.count then
            if index==0 then
                now=self.start
            else
                now=now.next
            end
            return index,now
        end
    end
end

--列表的变量遍历
function List:Foreach()
    local index=-1 
    local now
    return function()
        index=index+1
        if index < self.count then
            if index==0 then
                now=self.start
            else
                now=now.next
            end
            return index,now.val
        end
    end
end

--列表的插入
function List:Insert( index,val )
    if self:CheckRange(index) then
        if index ==0 then
            node=ListNode:New(arg,nil,self.start)
            self.start.last=node
            self.start=node
            self:CountPlusOne()
            return 
        end

        if index == self.count then
            self:Add(val)
            return
        end


        for k,v in self:For() do
            if k==index then
                node=ListNode:New(val,v.last,v)
                v.last.next=node
                v.last=node
                self:CountPlusOne()
                break
            end
        end
    end
end

--列表的删除
function List:Remove(index)
    if self:CheckRange(index) then
        self:CountReduceOne()
        if index ==0 then
            self.start = self.start.next
  
            return 
        end

        if index == self.count then
            self.finish=self.finish.last
            return
        end


        for k,v in self:For() do
            if k==index then
                v.last.next=v.next
                break
            end
        end
    end
end

--列表的插入
function List:At(index,newVal)
    if self:CheckRange(index) then
        for k,v in self:For() do
            if k==index then
                if newVal~=nil then
                    v.val=newVal
                end
                return v.val
            end
        end
    end
end

--列表是否存在变量
function List:Contains(val)
    for k,v in self:For() do
        if v.val==val then
            return true ,k
        end
    end
    return false
end

--清空列表
function List:Clear()
    self.start=nil
    self.finish=nil
    self.count=0
end

--列表的打印
function List:Print()
    for k,v in self:Foreach() do
        print(k,v)
    end 
end


local list = List:New(1,2,3,4,55,66,77)
list:Print()
print("================")

list:Insert(4,1000)
list:Print()
print("================")

list:Remove(6)
list:Print()
print("================")

print(list:At(3))
print("================")

print(list:At(3,2333))
print("================")

print(list:Contains(2333))
print("================")


list:Clear()
list:Print()
print("================")