print(os.time({year=1970,month=8,day=15}))
print(os.date())
print(os.date("%A"))
print(os.date("%d/%m/%Y %H:%M:%S"))
print(os.date("%c"))

print("===========================")

t=os.date("*t")
print(os.date("%Y/%m/%d",os.time(t)))
t.day=t.day+80
print(os.date("%Y/%m/%d",os.time(t)))

print("===========================")

local a1 = os.time({year=2015,month=1,day=12})
local a2 = os.time({year=2015,month=1,day=13})
print(os.difftime(a1,a2))

print("===========================")

c=os.clock()
s=0
for i=1,100000 do s=(s/2+1)*2 end
print(os.clock()-c)