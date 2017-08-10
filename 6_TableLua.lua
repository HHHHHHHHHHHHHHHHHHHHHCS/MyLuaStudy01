table1={};

tab2 = {key1=1000,key2="2000",};
print(tab1);
print(tab2);
print(tab2.key1);
print(tab2["key2"]);

tab3 = {"abc","def","ghi",1234,2e10};

print(tab3[0]);

print(tab3[1]);


for key,val in pairs(tab2) do
print(key.."------"..val);
end
print("-------------------");

for key,val in pairs(tab3) do
print(key.."------"..val);
end


table1.key1="www.baidu.com";
table1["key2"]="www.qq.com";

print("==============");

for key,val in pairs(table1) do
print(key.."------"..val);
end

table1.key1=nil;


print("==============");

for key,val in pairs(table1) do
print(key.."------"..val);
end

print("==============");

tab3[2]=nil;

for key,val in pairs(tab3) do
print(key.."------"..val);
end
