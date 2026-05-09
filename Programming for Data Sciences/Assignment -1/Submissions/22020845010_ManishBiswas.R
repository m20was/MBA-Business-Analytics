# Manish Biswas / PRN 22020845010
---------------------------------------------------------------------------------
install.packages("readxl")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("cowplot")
library(readxl)
library(dplyr)
library(ggplot2)
library(tidyverse)

studp = read_excel("D:/Study/Workspace/StudentsPerformance.xlsx")

view(studp)
summary(studp)
nrow(studp)
str(studp)
head(studp)
tail(studp)

# Total Students in each group

total_students= table(studp$group)
cbind(total_students)
colors1 = seq(612,656,by=3)
barplot(table(studp$group),col = colors1, main = "Total Students in each group")


marks = mutate(studp,total_marks = round(math_score+reading_score+writing_score))
cbind(marks)

#1)	Analyze the performance of one of the groups 
---------------------------------------------------------------------------------
  # Total no of Student passed in each group with passing marks >= 40
stud_pass_a = studp %>% filter(group == 'group A' & math_score >= 40 & reading_score >=40 & writing_score >= 40)
nrow(stud_pass_a)
stud_pass_b = studp %>% filter(group == 'group B' & math_score >= 40 & reading_score >=40 & writing_score >= 40)
nrow(stud_pass_b)
stud_pass_c = studp %>% filter(group == 'group C' & math_score >= 40 & reading_score >=40 & writing_score >= 40)
nrow(stud_pass_c)

 # Aggregate of each group in different score section
math_grp = studp %>% group_by(group) %>% summarise(mean_m = mean(math_score))
math_grp

read_grp = studp %>% group_by(group) %>% summarise(mean_r = mean(reading_score))
read_grp

write_grp = studp %>% group_by(group) %>% summarise(mean_w = mean(writing_score))
write_grp

avg_grp = studp %>% group_by(group) %>% summarise(avg_sum = mean(round(math_score+reading_score+writing_score)))  
avg_grp

dev.off(dev.list()["RStudioGD"]) 

plot1 = ggplot(math_grp, aes(x=group, y=mean_m,fill=group)) + geom_bar(stat="identity") + labs(x="Groups", y="Aggregate Math Score")
plot1

plot2 = ggplot(read_grp, aes(x=group, y=mean_r,fill=group)) + geom_bar(stat="identity") + labs(x="Groups", y="Aggregate Reading Score")
plot2

plot3 = ggplot(write_grp, aes(x=group, y=mean_w,fill=group)) + geom_bar(stat="identity") + labs(x="Groups", y="Aggregate Writing Score")
plot3

plot4 = ggplot(avg_grp, aes(x=group, y=avg_sum,fill=group)) + geom_bar(stat="identity") + labs(x="Groups", y="Aggregate of Total Score")
plot4

plot_grid(plot1,plot2,plot3,plot4,labels="AUTO")

#2)	Analyze the gender performance in Math for each group. 
----------------------------------------------------------------------------------
# Total Math Score for each Group & Gender
math_perf = studp %>% group_by(group,gender) %>% summarise(Total_Math = sum(math_score))  
math_perf
ggplot(math_perf,(aes(x=group,y=Total_Math,fill=gender))) + geom_bar(stat = "identity",position = "dodge")  
  
# 3) Add a new column “total mark” and analyze the group performance with respect to Total Marks	
-----------------------------------------------------------------------------------
#Added a new column “total mark”
marks = mutate(studp,total_marks = round(math_score+reading_score+writing_score))
view(marks)

#Total score for all groups based on gender on Bar Graph
grp_total = marks %>% group_by(group,gender) %>% summarise(Total_marks = sum(total_marks))  
grp_total
ggplot(grp_total,(aes(x=group,y=Total_marks,fill=gender))) + geom_bar(stat = "identity",position = "dodge")

#Total score performance based on only groups on Box Plot
ggplot(marks, mapping=aes(x=group, y=total_marks))+geom_boxplot()

#Total score performance for all groups based on gender on Box Plot
ggplot(marks, mapping=aes(x=group, y=total_marks, fill=gender))+geom_boxplot()

----------------------------------------------------------------------------------
  # Manish Biswas / PRN 22020845010
