local mt={}
for i=1,10 do
    local row ={}
    mt[i]=row
    for j=1,20 do
        row[j]=0
    end
end

local mt={}
local v=1
for i=1,10 do
    for j=1,20 do
        mt[v]=0
        v=v+1
    end
end


local mt={}
for i=1,10 do
    mt[i]={}
    for j=1,20 do
        mt[i][j]=0
    end
end