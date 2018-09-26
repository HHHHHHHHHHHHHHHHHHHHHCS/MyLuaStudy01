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
