#########################################################################
#Vectors
#"A vector is a collection of elements which is most commonly of 
# character, integer, logical or numeric"
#########################################################################

n = c(2, 3, 5) # vector of numerical value
class(v)
l = c(TRUE, FALSE, TRUE, FALSE, FALSE) # vector of logical values
# To find number of members in a vector
length(l)

#combining vectors
n = c(1,2,3)
s = c("a","b")
x =c(n,s) 
x
class(x) # Value coercion to character string to maintain the same datatype

# vector arithmetic
a = c(1,2,3)
5*a
b = c(2,2,2)
a + b
a / b

#Addition
u= c(10, 20, 30)
v = c(1, 2, 3, 4, 5, 6, 7, 8)
u+v # Recylcing is happening here. Since both vectors are of different length

#Vector Index
s = c("aa", "bb", "cc", "dd", "ee")
s[1]
s[3] = "hh"

#Negative Index - Strip the member whose index is mentioned 
s[-3]

#Out of range Index - Missing value is reported with NA
s[20]

#Slicing a new vector by specifying the indexes
s[c(1,4)]
x = s[c(2,2,3)]

str(x) # display structure

#Slicing by giving range
s[2:3]
s[c(1,3,5)]

#Logical Index vector
s = c("aa", "bb", "cc", "dd")
L = c(FALSE, TRUE, FALSE, TRUE)
s[L]
s[c(FALSE, TRUE, FALSE, TRUE)]

#Named Vector members
#We can assign names to vector members.

v = c("Mary", "Sue")
names(v) = c("First", "Last")
v["First"]

#########################################################################
#Lists
#lists are the second type of vector. Lists are the objects of R 
#which contain elements of different types such as number, vectors, 
#string and another list inside it
#########################################################################


# defining a list
n = c(1,2,3)
s = c("a", "b")
b = c(TRUE,FALSE,TRUE)
x = list(n,s,b)
y = list(1,"r",T)
y1 = list(1,"r",T)

#Accessing a list or slicing

x[2]
x[[2]][1]
x[c(2,1)] # Accessing 2nd and 1st member from the list
x[[2]] = c(1,2) # modifying a list
x[[2]] = s
x
x[2] # Accessing 2nd member of a list
x[[2]][1] # 

x[[2]] = c("c","d")  # modifying 2nd member of a list

x

# Assign names to the members and accessing named members
y = list(int=n,str=s) ;
y["int"]

y[c("int","str")]

y$"int"[1]
y[["str"]][1]

#########################################################################
#In R, arrays are the data objects which allow us to store data in more than 
#two dimensions. 
#########################################################################

#Creating two vectors of different lengths  
#vec1 = c("a","b",c)  
vec2 = c(seq(1:12))  

#Taking these vectors as input to the array   
res =array(vec2,dim=c(3,2,2))  # 3 dimensional array  )
print(res)  

x = c(vec1,vec2)


#Initializing names for rows, columns and matrices  
col_names = c("Col1","Col2")  
row_names = c("Row1","Row2","Row3")  
matrix_names = c("Matrix1","Matrix2")  

#Taking the vectors as input to the array   
res = array(c(vec1,vec2),dim=c(3,2,2),dimnames=list(row_names,col_names,matrix_names))  
print(res)  




#########################################################################
# Defining matrix
#A two-dimensional rectangular data set is known as a matrix.
#########################################################################
A = matrix(
  c(2, 1, 4, 5, 3, 7),
  nrow=2)
A

B = matrix(
  c(2, 1, 4, 5, 3, 7),
  nrow=2,
  byrow=T)
B
B[2,3] # accessing a specific element
B[,3] # Accessing rows an columns, the result is a vector
B[2,]

B[,3, drop=FALSE] # the result is a new matrix

# Assigning row and column names
dimnames(B) = list(c("row1","row2"),
                   c("col1","col2","col3")
)
B
# Accessing by specifying row and col names
B["row2","col1"]

#Binding 2 matrix
B=t(B)
B
B = matrix(
  c(2, 1, 4, 5, 3, 7),
  nrow=2,
) ;B

B=t(B)
C= matrix(c(7,4,2),nrow = 3);C
cbind(B,C) # joining two matrices. column bind having same number or rows 

A = matrix(1:6,nrow=3);A
B = matrix(11:16,nrow=3);B
A+B


# Attaching a variable , meaning we can directly access it without qualifying it
y = list(m= c("a","b"), n = c(1,2))
y$m
attach(y)
m
detach(y)
int  

# data frames
n = c(1,2,3)
s = c("jim","john","smith")
f = data.frame(n,s) 
f
f["n"]
f[["n"]][1]


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
y = c("Moradabad","Lucknow","Etah","Sambhal","Khurja","Uppal","City 2")  
cbind(emp.data,Address=y)  

print(summary(emp.data))

#########################################################################
#factor are the data objects which are used to categorize the data 
#and store it as levels. They are useful for storing categorical data
#########################################################################
height <- c(132,162,152,166,139,147,122)  
weight <- c(40,49,48,40,67,52,53)  
gender <- c("male","male","female","female","male","female","male")  
# Creating the data frame.  
input_data<- data.frame(height,weight,gender)  
print(input_data)  
factor(gender)

#########################################################################
#library(MASS) # Modern applied Statistics in R
#########################################################################

# install.packages("MASS") - Install a new package
# library(MASS) Loading the package
data()
mtcars
mtcars[1,]  # access row 1, all columns
mtcars[,1:2] # access all rows and 1 and 2nd col

mtcars["mpg"] # access col mpg
mtcars$cyl    # access col cyl
names(mtcars) # col names
row.names(mtcars) # row names

nrow(mtcars) # count of rows
ncol(mtcars) # count of cols
head(mtcars,6)


# Creating a subset
xx=mtcars[c("mpg","cyl")] ; xx
head(xx,8)

# row slicing
mtcars[24,]
mtcars[c(2,5),]                  #Numeric indexing
mtcars["Datsun 710",]            #Name indexing

mtcars[5:10,3:5]


