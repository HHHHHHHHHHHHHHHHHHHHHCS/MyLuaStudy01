io.write("Sin(3):",math.sin( 3 ),'\n')

io.write(string.format( "Sin(3):%.4f\n", math.sin( 3 )))

--[[
t=io.read("a")
t=string.gsub( t,"bad","good" )
io.write(t)
--]]

count=0
for line in io.lines() do
    count=count+1
    io.write(string.format( "%6d",count ),line,"\n")
end

local n1,n2,n3=io.read("n","n","n")
if n1 then 
print(math.max( n1,n2,n3 ))
end