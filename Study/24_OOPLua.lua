--[[
--lOWB 做法
person = {name="D_N",age=23333};

person.Eat=function (  )
	print(person.name.." eating");
end

function person.Old(  )
	print(person.name,person.age);
end

person.Eat();
person.Old();

--]]

Person = {name="D_N",age=23333};

Person.Eat=function ( self )
print(self.name.." eating");
end

function Person:Old(  )
	print(self.name,self.age);
end

Person.Eat(Person);
Person:Old();
print("========================");
function  Person:New(o)
	local t= o or {};
	setmetatable(t,{__index=self});
	
	return t;
end

a = Person:New();

a.Eat(a);
a:Old();
a.Old(a);
print("========================");
a.name="Death Note";
Person.Eat(Person);
a.Eat(a);
print("========================");
people=Person:New();
people.weight = 100;
people.Eat(people); 
people:Old(); 
print(people.weight); 
print("========================");
Student = Person:New();

Student.grade=1;

stu1=Student:New();

print(stu1.grade);