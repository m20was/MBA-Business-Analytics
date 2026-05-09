# Read dataset painters
# View it
# view the heads, tail, structure
# display the column names and row name
# display structure
# display summary

install.packages("MASS")
library("MASS")

# Print rows from the dataset painters
data()

?painters

View(painters)
head(painters)
tail(painters)

nrow(painters)
str(painters)


summary(painters)



#1 Find number of painters in each school , print it column wise
#2 Find the school names with max_ painters
#3 Find the percentage of painters in each school
#4 Plot a bar chart of school vs frequency
#5 Draw a pie chart using rel_ freq
#6 For School C, find the mean(composition)
#7 Find the Freq dist for painter composition scores

painters$School
table(painters$School)
school_freq = table(painters$School)

cbind(school_freq) # print in column format

# School with most painters
school_max_freq = max(school_freq)

# L = school_freq == school_max_freq
which(school_freq == school_max_freq)

x =  which(school_freq == school_max_freq)

names(x) # retrieve column names

names(which(school_freq<7))


# Find the proportion of painters distributed across school_ Calc Rel_ Freq
#options(digits=4)

school_relfreq = round(school_freq / nrow(painters) * 100 ,2)

cbind(school_freq,school_relfreq)

options(digits=3)

par(mfrow=c(1,2)) # create partitions in the plot

# Plot a bar graph for the schools
colors = c("red", "yellow",
           "green", "violet", "orange",
           "blue", "pink", "cyan")

colors1 = seq(612,656,by=3)
barplot(school_freq,col=colors1,main="bar chart")
pie(school_freq,col=colors1,main="pie chart")

school = painters$School

c_painters = painters[school == "C",]
mean(c_painters$Composition)

# mean of composition for each school
x=tapply(painters$Composition,painters$School,mean)
cbind(x)

tapply(painters$Composition,painters$School,max)
apply(painters,2,max)

###################################

school_comp = table(painters$Composition)
cbind(school_comp)
barplot(school_comp,col=colors1)

#Find the school with highest composition score
comp_school_max = tapply(painters$Composition,painters$School,max)
cbind(comp_school_max)

max_comp_all = max(comp_school_max)

x = which(comp_school_max == max_comp_all)

names(comp_school_max[comp_school_max == max_comp_all])


#Use the function which to find out painters whose color score is equal to
#or above 14_

x = painters$Colour >=14
painters[painters$Colour >=14,]

########################################################
Qualitative Data Analsysi

########################################################
head(faithful)
View(faithful)
?faithful

# Frequency dist of qualitative data


duration = faithful$eruptions
breaks = seq(1.5,5.5,by=0.5)

duration_cut = cut(duration,breaks,right=F)

duration_freq = table(duration_cut)

cbind(duration_freq)

#cut(duration,5)
nrow(faithful[duration <= 2,])

h=hist(duration,breaks=breaks,right=F,plot=T)

len = length(h$breaks)
duration_freq_2 = h$counts
a = h$breaks[1:len-1]
b = h$breaks[2:len]
labels = paste("(",a,"-",b, ")",sep="")
labels
names(duration_freq_2) = labels
cbind(duration_freq_2)

hist(duration,right=F,col=colors,
     main="Old Faithful Eruptions",
     xlab="Duration in min")


#Cumulative freq
breaks = seq(45,100,by=5)
waiting_cut = cut(faithful$waiting,breaks,right=T)
waiting_cut_freq = table(waiting_cut)
cbind(waiting_cut_freq)
waiting_cumfreq = c(0,cumsum(waiting_cut_freq))
plot(breaks,waiting_cumfreq, main="Cum sum",
     xlab="Duration in min", ylab="Cumulative waiting period")

lines(breaks,waiting_cumfreq)

fn= ecdf(faithful$eruptions)
plot(fn,main="Cum sum",
     xlab="Duration in min", ylab="Cumulative waiting period")


stem(faithful$eruptions)
plot(faithful$eruptions,faithful$waiting)

mean(faithful$waiting)
summary(faithful)
quantile(faithful$waiting)
quantile(faithful$waiting,c(0.32,0.50,0.95))


############################################
# Examine the colors in R

colors()
x = seq(612,655,by=3)
# Barplot using color names
barplot(x, col=x)
###########################################





