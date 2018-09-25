Account = {x = "xxxx", y = "yyyy", balance = 0}
function Account:New(o)
    o = o or {}
    self.__index = self
    setmetatable(o, self)
    return o
end

function Account:Deposit(v)
    self.balance = self.balance + v
end

function Account:Withdraw(v)
    if v > self.balance then
        error("error")
    end
    self.balance = self.balance - v
end

print(Account:New().x)
n=Account:New()
print(n.balance)
n:Withdraw(-10)
print(n.balance)

SpecialAccount=Account:New()

function SpecialAccount:Withdraw(v)
    if v > self:GetLimit() then
        error("error")
    end
    self.balance = self.balance - v
end

function SpecialAccount:GetLimit()
    return self.limit or 0
end

s=SpecialAccount:New{limit=1000}
print(s:GetLimit())
s:Withdraw(100)
print(s.balance)

print("===================================")

local function Search(k,plist)
    for i=1,#plist do
        local v=plist[i][k]
        if v then
            return v
        end
    end
end

function CreateClass(...)
    local c={}
    local parents={...}

    setmetatable(c, {__index=function(t,k)
        return Search(k,parents)
    end})

    c.__index=c

    function c:New(o)
        o=o or {}
        setmetatable(o, c)
        return o
    end

    return c
end

Named={}

function Named:GetName()
    return self.name
end
function Named:SetName(n)
    self.name=n
end

NameAccount=CreateClass(Account,Named)
c=NameAccount:New()

print(c.balance)
print(c:SetName("2333"))
print(c:GetName())