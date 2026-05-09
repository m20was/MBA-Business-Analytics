#######################################################################
# Conditional Statement if and else
# looping statement while, for

#######################################################################

x = 20  
y = 24  
count=0  
if(x<y) {  
  cat(x,"is a smaller number\n")  
  count=1  
}  

if(count==1){  
  cat("Block is successfully execute")   ## cat is to print on screen or file
}  

count = 1
if (count == 1)
  print("hello")


a = 33
b = 45

if (b > a) {
  print("b is greater than a")
} else print ("a and b are equal")
 

#####exmample 2

x = 1  
y = 6  
count=0  
while(x<y){  
  print(paste("The value of x is ",x))  
  x=x+1  
  if(x==11)  
    break  
}  

#### example 3



yr = 1999

if ( (yr%% 4 == 0) && (yr %% 100 !=0) ) {
    print(paste(yr," is a leap year"))
  } else if ( yr%% 400 == 0)  {
  print(paste(yr," is a leap year"))
  } else print(paste(yr," is a leap year"))


### if else if

age = 25
age <- as.integer(age)  

if(age<18) { 
  print("You are child")
} else if(age>30)
  { print("You are old guy")
} else  
  print("You are adult")


# for loop
fruits = c("apple","banana","pear")

for(i in fruits) 
  {
  print(i)
}

for( i in seq(1,6,by=2))
{
  print(i)
}

# While loop

v <- c("Hello","while loop","example")  

cnt = 2  
while (cnt < 7)
{  
  print(v)  
  cnt = cnt + 1  
}

### Sum of all digits of a numberr

n = readline(prompt="please enter any integer value: ")  

n =as.integer(n)  
sum = 0  
while(n!=0){  
  sum=sum+(n%%10)  
  n=as.integer(n/10)  
}  
print("sum of the digits of the numbers is=",sum)  



### program to check if a number is palindrome or not
n = 12321
num<-n  
rev<-0  

while(n!=0){  
  rem<-n%%10  
  rev<-rem+(rev*10)  
  n<-as.integer(n/10)  
}  
print(rev)  
if(rev==num){  
  cat(num,"is a palindrome num")  
}else{  
  cat(num,"is not a palindrome number")  
}  

### repeat, next and break 

a = 0            
repeat {   
  a <- a+1 
  if(a == 7)    
    break    
  if(a == 5){    
    next       
  }    
  print(a)    
     
}










