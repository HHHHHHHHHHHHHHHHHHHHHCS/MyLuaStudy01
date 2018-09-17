function ListNew(  )
    return {first=0,last=-1}
end

function PushFirst(list,value)
    local first = list.first-1
    list.first=first
    list[first]=value
end

function PushLast(list,value)
    local last = list.last+1
    list.last=last
    list[last]=value
end

function  PopFirst( list )
    local first = list.first
    if first>list.last then 
        error("list is empty")
    end
    local value = list[first]
    list[first]=nil
    list.first=first+1
    return  value
end

function  PopLast( list )
    local last = list.last
    if list.first>last then 
        error("list is empty")
    end
    local value = list[last]
    list[last]=nil
    list.last=last-1
    return  value
end

print("==================")

local list = ListNew()
PushFirst(list,1)
PushFirst(list,2)
PushFirst(list,3)
PushFirst(list,4)
PushFirst(list,5)
PushLast(list,"A")
PushLast(list,"B")
PushLast(list,"C")
PushLast(list,"D")
PushLast(list,"E")
print(PopLast(list))
print(PopFirst(list))
print(PopFirst(list))
print(PopLast(list))