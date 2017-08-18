--:是个语法糖，调用的函数会自动传递参数self
a = { x = 1 }  
function a.fun(self)   
print(self.x)  
end  
  
a.fun(a)--输出1，将a自己做为参数传给fun函数的self  


function a:fun()   
print(self.x)  
end  
  
a.fun(a)  


function a:fun()   
print(self.x)  
end  
  
a:fun()  