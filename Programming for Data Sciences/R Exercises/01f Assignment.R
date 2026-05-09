###### Home work ***********

#########################################################################
#1 Draw a circle
#########################################################################

r = 3
x = seq(-r,r,by=0.1)
y = sqrt(r*r - x*x)
plot(c(x,x),c(y,-y))


#########################################################################
#2 Factors of a number
#########################################################################
v = c()
num = 20
for (i in 2:num) {
  if (num %% i == 0)
    v = append(v,i)
}

print(v)

#3

#########################################################################
# Creating the data frame.  
#########################################################################
emp.data =  data.frame(  
  employee_id = c (1:5),   
  employee_name = c("Shubham","Arpita","Nishka","Gunjan","Sumit"),  
  sal = c(623.3,915.2,611.0,729.0,843.25))   
str(emp.data)

temp = emp.data[1,]  
print(temp)

#Adding row in the data frame  
x = list(6,"Vaishali",547,"2015-09-01")  
emp.data = rbind(emp.data,x)  

#Adding column in the data frame  
y = c("Moradabad","Lucknow","Etah","Sambhal","Khurja","Uppal")  
cbind(emp.data,Address=y)  

emp.data$sal
cbind(emp.data$sal)


