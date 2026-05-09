##############################################################################
# Load the libraries
# Install if the packages are not included
#install.packages("dplyr") - for using groupby function
# install.packages("ggplot2") - For visualization
#install.packages("cowplot")

library(readxl)
library(dplyr)
library(ggplot2)
library(cowplot)

#Divide the plot panel
par(mfrow=c(1,1))

##############################################################################

# Read the file
tips = read_excel("C:/Rekha/02 Study/RPrograms/InputFiles/tips.xls")

# View the data
View(tips)
head(tips)
tips$day
tail(tips)
summary(tips)
nrow(tips)
str(tips)
##############################################################################

#Set colors scheme
colors = seq(612,656,by=3)
##############################################################################
# function in dplyr package
#filter,group_by, summarise, mutate,arrange

# Check NA values

# filter
tips %>% filter(is.na(gender))

tips %>% filter(is.na(tip))

tips %>% filter(time=='Dinner' & size == 2)

#
grpby = tips %>% group_by(day,gender) %>%
  summarise(sum_tip_amt = sum(tip))  
grpby

# use summarise function on the entire datase

summarise(tips, med = median(total_bill))

#mutate - to add a new col
new_tips = mutate(tips,tip_pct = round(tip/total_bill *100,2))
new_tips$tip_pct

# arrange or order
tips_sort = arrange(tips,size)
View(tips_sort)

arrange(tips,desc(size))

# Select columns
select(tips,c("day","time"))
tips[,c("day","time")] # or this command to select the specific columns

##############################################################################
# tip distribution across smoker, gender, time, day
# to clear the plots
dev.off(dev.list()["RStudioGD"]) 

ggplot(tips, aes(x=tip)) + 
  geom_freqpoly(binwidth=1,size=1)

p1=ggplot(tips, aes(x=tip,color=smoker)) + 
  geom_freqpoly(binwidth=1,size=1)

p2=ggplot(tips, aes(x=tip,color=gender)) + 
  geom_freqpoly(binwidth=1,size=1)


p3 = ggplot(tips, aes(x=tip,color=time)) + 
  geom_freqpoly(binwidth=1,size=1)

p4 =ggplot(tips, aes(x=tip,color=day)) + 
  geom_freqpoly(binwidth=1,size=1)

plot_grid(p1,p2,p3,p4,labels="AUTO")
# plot days of the size Vs number of tips

##############################################################################

x=arrange(tips,size) # Arrange function to order
tips_table = table(x$size)
tips_table

barplot(tips_table,col=colors,main="Size Vs No. Of Tips",xlab="Day",ylab="Count")

# plot days of the week Vs number of tips
day_table = table(tips$day)
day_table

barplot(day_table,col=colors,main="Day Vs No. Of Tips",xlab="Day",ylab="Count")

day_table
### Observation###
# On Saturday(87) maximum tips received, followed by Sun (76)
#################################
# Group by day/gender/sum of tip amt



ggplot(tips,(aes(x=day,fill=gender))) +
  geom_bar()

ggplot(tips,(aes(x=time,fill=day))) +
  geom_bar()

ggplot(tips,(aes(x=day,fill=gender))) +
  geom_bar()


#Group by day and gender, sum up the tip amt 

grpby = tips %>% group_by(day,gender) %>%
  summarise(sum_tip_amt = sum(tip))

ggplot(grpby,(aes(x=day,y=sum_tip_amt,fill=gender))) +
  geom_bar(stat = "identity",position = "dodge")

# stat="identity" means we will provide the y-axis
# position dodge , side by side bars
# try dodge 2 or no value


##################################################################
# Total Tips Vs Gender

gender_table = table(tips$gender)
barplot(gender_table,col=colors,main="Gender Vs Total Tips")
gender_table
barplot(tapply(tips$tip,tips$gender,sum),col=colors,main="Gender Vs Total Tip Amt")
  
#Box plot

p1_box=ggplot(tips, mapping=aes(x=day, y=total_bill))+geom_boxplot()
p1_box

tips %>% filter(total_bill>40)

# Scatter plot
x=ggplot(tips, aes(x=total_bill, y=tip,fill=day)) +
  geom_point(size=2, shape=23)
x
y=ggplot(tips, aes(x=total_bill, y=tip,fill=time)) +
  geom_point(size=tips$size, shape=23) 
y
plot_grid(x,y)


# Pie chart

grpby1 = tips %>% group_by(day) %>%
  summarise(sum_tip_amt = round(sum(tip)/sum(tips$tip) *100,2))

ggplot(grpby1, aes(x = "", y = sum_tip_amt, fill = day)) +
  geom_bar(stat="identity", width=1) +
  coord_polar(theta = "y") +
geom_text(aes(label = paste0(sum_tip_amt, "%")), 
          position = position_stack(vjust=0.5))+
  labs(x = NULL, y = NULL) +
  theme(axis.line = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank())  +
  ggtitle("Pie Chart for Day Vs Total Bill Amount")

# Calculate the correlation coeff between tip and total_bill
cor(tips$tip,tips$total_bill,method = "pearson")

