## Declaring function

is_leap_year = function(yr) {
  ans = paste(yr,"is not a leap year")
  
  if ( (yr%% 4 == 0) && (yr %% 100 !=0) ) {
    ans = paste(yr," is a leap year") }
  
  if ( yr%% 400 == 0)  {
    ans = paste(yr," is a leap year") }
  
  return (ans)
}

is_leap_year(1900)


my_function <- function(x) {
  return (5 * x)
}

print(my_function(3))
print(my_function(5))
print(my_function(9))

#Factors of a number
v = c()
num = 20
for (i in 2:num) {
  if (num %% i == 0)
    v = append(v,i)
}

print(v)
