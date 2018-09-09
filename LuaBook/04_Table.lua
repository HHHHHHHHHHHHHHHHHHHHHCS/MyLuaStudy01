tb={1,2,3,4,5,6,7,8,9,10}

table.move(tb,5,10,1)
for k,v in pairs(tb) do
print(k,v)
end
print("=================")
tb[#tb]=nil
for k,v in pairs(tb) do
    print(k,v)
end
print("=================")
tb2={100,110,120,130,140,150,160,170,180,190,200}
table.move(tb,5,10,5,tb2)
for k,v in pairs(tb2) do
    print(k,v)
end