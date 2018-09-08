tb={}
tb[2]=20
tb[2.1]=21
print(tb[2.0])
print(tb[2])
print(tb[2.1])

print("=======================")

tb={color="blue",name="bob",age=10,
{x=0,y=0},
{x=1,y=1},
{x=2,y=2},
{x=3,y=3},
{x=4,y=4},}

print(tb[color],tb.name)
print(tb[0],tb[1],tb[2],tb[3])
print(#tb)
tb.age=nil
print(#tb)

print("=======================")

tb={}
tb[1]=1
tb[2]=2
tb[500]=500
tb[1000]=1000
print(#tb)

tb={1,2,3,nil,nil}
print(#tb)

print("=======================")
family={}
--family.son.id.idnumber 检查中间是否为空
temp={}
idnumber = (((family or temp).son or temp).id or temp).idnumber
print(idnumber)