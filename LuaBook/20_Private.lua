function NewAccount(initialBalance)
    local self = {balance = initialBalance, LIM = 1000}

    local widthdraw = function(v)
        self.balance = self.balance - v
    end

    local deposit = function(v)
        self.balance = self.balance + v
    end

    local extra = function()
        if self.balance > self.LIM then
            return self.balance * 0.1
        else
            return 0
        end
    end

    local getBalance = function()
        return self.balance + extra()
    end

    return {
        widthdraw = widthdraw,
        deposit = deposit,
        getBalance = getBalance
    }
end

acc1 = NewAccount(1000)
print(acc1.getBalance())
acc1.widthdraw(40)
print(acc1.getBalance())
acc1.deposit(80)
print(acc1.getBalance())


print("=========================")

function newObject(value)
    return function (action,v)
        if action=="get" then 
            return value 
        elseif action=="set" then
            value=v
        else
            error("invalid action")
        end
    end
end

d=newObject(10)
print(d("get"))
d("set",20)
print(d("get"))

print("=========================")

local balance={}

Account={}

function Account:widthdraw(v)
    balance[self]=balance[self]-v
end

function Account:deposit(v)
    balance[self]=balance[self]+v
end

function Account:balance()
    return balance[self]
end

function Account:new(o)
    o=o or {}
    setmetatable(o, self)
    self.__index=self
    balance[o]=0
    return o
end

a=Account:new{}
a:deposit(100)
print(a:balance())