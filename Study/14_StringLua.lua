a="Hello\n\\World My Name is \'D_N\'";
path = "C:\\users\\yoooooo1\b";
print(a);
print(path);


str1="TEST: My Name is  D_N";
str2 = string.upper(str1);
str3=string.lower(str1);

str4=string.gsub(str1,"D_N","YOOOOOO");
str5= string.gsub(str1,"T","o");
str6= string.gsub("TTTTTTT","T","e",3);
print(str1,str2,str3,str4,str5,str6);


index=string.find(str1,"TEST");
print(index);
index=string.find("123456789123456789","1");
print(index);
index=string.find("123456789123456789","asd");
print(index);
index=string.find("123456789 123456789","1",5);
print(index);
str7=string.reverse("123456789 123456789");
print(str7);


num1 = 5;
num2=10;
ans = string.format("加法:"..num1.."+"..num2.."="..(num1+num2));
print(ans);
ans = string.format("加法:%d+%d=%d ",num1,num2,num1+num2);
print(ans);
account = "admin";
password = "******";
ans = string.format("account:%s password:%s",account,password);
print(ans);


print("===================================")

print(string.char(97,65,48,0100));
print(string.byte("ASdsa1"));
print(string.byte("ASdsa1",1));
print(string.byte("ASdsa1",2));
print(string.len("ASdsa1"));
print(#"ASdsa1");
print(string.rep("ABCD",4));

for item in string.gmatch("Hello World Lua Yoooooooo yoyo qie ke nao","%a+")do
print(item);
	end