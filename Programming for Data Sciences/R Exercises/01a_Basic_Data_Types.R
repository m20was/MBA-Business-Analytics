# Assigning numeric data
z = 1.5
z
class(z) # Internal class assigned by R

# Converting to Integer data type
y = as.integer(5.567)
y

int_z = as.integer(z)
print(int_z)

x = 10L # to explicitly specify integer data types
class(x)

x = 10.5
class(x)
x = 5
class(x)

z=T
class(z)

# Type conversion
x = as.numeric("5.5")
x = as.integer("5.678")

# Math operations

min(5,10,15) # max, sqrt, ceiling, floor , abs


# Character data type
s = "This is \"my first R Program"

print(s)
cat(s)
nchar(s) # number of chars in the string 

x = as.character("3.14") # Convert any data to character data type
fname = "John" 
lname = "Doe"
paste(fname,lname) #Join two strings

# String functions
str = " this is 
a 
very
   long string 

"
str
cat(str)

x = readline("Enter name")
x
print(str)

nchar(s) # length of the str

str = "Hello world"
grepl("h",str) ## to find a match
grepl("hello",str,ignore.case = T)

str1 = "good morning"
paste(str,str1)

sprintf("%s has %.3f dollars","Sam",100.02375)

str = "How to add a \"\" in a string"
cat(str)
print(str)

#String manipulation
substr("Ms. Rekha",start=5,stop=15) # substring of a string
sub("small","big","This is a small box") # replace a string
help("substr")

# Misc operators
x = 1:10 # create a seq
a = c(1,2,3)
b = 1
b %in% a # to check if element belongs to a vector

# complex data types
z = 1 + 2i # combination of pure and imaginary value i
class(z)

# Assignments
x <- 3
3 -> y
x <<-5
x = 3


#logical
x = 1
y = 10 
z = x > y
z
u = TRUE
u = True
u = T

v = FALSE
u & v
help("&")

x = 5
if (x > 1 && x < 10) # || - Logical or , !- Not  
  print("x is betweeen 1 and 10")

# Creating readable string
sprintf("%s has %d dollars","Same",100)


# Factor represents a categorical data type R, like color, rating

# Create a vector as input.
data <- c("East","West","East","North","North","East","West","West","West","East","North")

factor_data <- factor(data)
print(factor_data)

# Raw data type
v <- charToRaw("Hello")
print(class(v))
v

