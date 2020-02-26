################################################################
############# Statistical Programming with R ###################
################################################################

#So far, we have learned
#1. Types of data and objects
#2. Import and export data
#3. Basic statistical functions
#4. Merge data across databases
#5. Merge using match command
#6. Data manipulation and extraction
#7. Apply function
#8. Subset and sort data
#9. Conversion of data

#A brief revision of the concepts

#Session 5
###################################################
## Use inbuilt datasets available with R Studio ###
###################################################
#Play and learn with inbuilt datasets in R
#datasets package in R
#Not necessary to load for using datasets
library(datasets)#Load the package
help("datasets")
#See the list of datasets available
data()

#Learn more about a dataset
help("women")#Mention name of dataset
help("BOD")
#This data set gives the average heights and weights for
#American women aged 30-39.

#Use/load datasets
data("women")
women#Height and weight of 15 women
#Similarly use other datasets as per your needs
#Soil your hands to learn more
###################################################
###################################################


###################################################
############# Basic plotting ######################
###################################################
attach(women)#By attaching, you can use column names directly

women

#Make scatterplot
###################################################
plot(height,weight)

#Other Generic graphic commands could be used as usual
#xlab, ylab, xlim, ylim, main

plot(height,weight, main="Scatterplot")
plot(height,weight, main="Scatterplot",xlab = "HEIGHT",ylab = "WEIGHT")

plot(height,weight, main="Scatterplot",xlab = "HEIGHT",
     ylab = "WEIGHT", xlim = c(50,80))

plot(height,weight, main="Scatterplot",xlab = "HEIGHT",
     ylab = "WEIGHT", xlim = c(50,80), ylim = c(100,180))

#change dot shape
plot(height,weight, main="Scatterplot", pch=9)

#Add colour
plot(height,weight, main="Scatterplot", pch=2, col="Red")

#Add best fit regression line
abline(lm(weight~height))

#change colour of abline
abline(lm(weight~height), col="Blue")
#########################################################


#Make line chart
#########################################################
plot(height,weight, main="Line Chart", type = "l")

#change the colour of line
plot(height,weight, main="Line Chart", type = "l", col="Red")

#Other commands (xlab, ylab, xlim, ylim, main) are
#as same as we used in plotting scatterplot
######################################################
######################################################

##Making Bar chart
######################################################
##For categorical variables only
#Import "Lung Cap_Random_csv" file
x=read.csv(file.choose())
attach(x)
class(x)
summary(x)

table(Smoke)
#Make Bar plots of categorical variables
#attach
#Make a bar plot in %
barplot(table(Smoke)*100/50)
#Add Labels
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking")
#Change category name
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking",
        names.arg = c("Non-Smokers", "Smokers"))
#Add a title
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking",
        names.arg = c("Non-Smokers", "Smokers"), 
        main = "Smoking Habits")
#Add colours to the life
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking",
        names.arg = c("Non-Smokers", "Smokers"), 
        main = "Smoking Habits", col = c("Red", "Blue"))
#Make % look better, rotation of values on y axis by 
#putting las=1
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking",
        names.arg = c("Non-Smokers", "Smokers"), 
        main = "Smoking Habits", col = c("Red", "Blue"),
        las=1)

#Make x-axis look better by rotating the values on x axis by 
#putting las=2
barplot(table(Smoke)*100/50, ylab = "%", xlab = "Smoking",
        names.arg = c("Non-Smokers", "Smokers"), 
        main = "Smoking Habits", col = c("Red", "Blue"),
        las=2)

#Make it Horizontal
barplot(table(Smoke)*100/50, ylab = "Smoking", xlab = "%",
        names.arg = c("Non-Smokers", "Smokers"), 
        main = "Smoking Habits", col = c("Red", "Blue"),
        horiz = T)
##########################################################
#Make Pie Chart
#work on "Lung Cap_Random_csv" file

pie(table(Smoke))

#Add a title
pie(table(Smoke),main = "Smoking Habits")

#Add colours to the life
pie(table(Smoke),main = "Smoking Habits",
    col = c("Red", "Blue"))
#Add box around it
box()
##################################################
#Add annotated % to labels (no, yes), Little Tricky
#Create labels as No 48%
names(table(Smoke))
(table(Smoke)/50)*100
lbls <- paste(names(table(Smoke)), (table(Smoke)/50)*100, "%")
pie(table(Smoke),labels = lbls, col = c("Red", "Blue"),
    main = "Smoking Habits")
box()


##################################################
#Make 3D pie charts
#Install a package "plotrix"
#Import the file and attach it
x=read.csv(file.choose())
attach(x)
library(plotrix)
lbls <- paste(names(table(Smoke)), (table(Smoke)/50)*100, "%")
pie3D(table(Smoke),labels = lbls, col = c("Red", "Blue"),
      main = "Smoking Habits", explode=0.2)
#Explode to show a distance in slices
slices <- c(10, 12, 4, 16, 8)
lbls <- c("US", "UK", "Australia", "Germany", "France")
pie3D(slices,labels=lbls,explode=0.2,
      main="Pie Chart of Countries ")


#One more example
#Nonsmoker=24, Smoker= 26
lbls=c("Nonsmoker", "Smoker")
slices=c(26,24)
pct = round(slices/sum(slices)*100)
lbls = paste(lbls, pct, "%") # add percents to labels 
pie(slices,labels = lbls, col = c("Red", "Blue"),
    main = "Smoking Habits")
##############################################
##############################################

##How to make histogram in R
#Import "RELIANCE_close price" file
x=read.csv(file.choose())
attach(x)
ret_close=diff(log(Close))#Log differences or returs
summary(ret_close)
##########################################
#Make Histogram of Returns
hist(ret_close)
##Change number of bins to make it look better
hist(ret_close, breaks = 200)
##Change the limit of x axis
hist(ret_close, breaks = 200, xlim = c(-0.05,0.05))
##Now looks better

#Change labels of x and y axis
hist(ret_close, breaks = 100, xlim = c(-0.05,0.05),
     xlab = "Returns", ylab = "Frequency")
#Have a great title
hist(ret_close, breaks = 100, xlim = c(-0.10,0.10),
     xlab = "Returns", ylab = "Frequency", main = "Returns Distribution")
#Set ylim
hist(ret_close, breaks = 100, xlim = c(-0.10,0.10),ylim = c(0,30),
     xlab = "Returns", ylab = "Frequency", main = "Returns Distribution")

#Add Density Curve to it
lines(density(ret_close))
#Change colour of it
lines(density(ret_close, adjust = 2), col="Red", lwd=2)
#####################################################



##Box plot in R
#box-and-whisker plot as well
data("women")
women#Height and weight of 15 women
attach(women)#By attaching, you can use column names directly

#Make a boxplot of height
boxplot(height)

#the ends of the box are the upper and lower quartiles
#so the box spans the interquartile range.
#the median is marked by a vertical line inside the box.
#the whiskers are the two lines outside the box that extend to the highest and lowest observations.
#We can check skewness (symmetry)
#It reports summary of data graphically

#So it shows
#1. Central tendency (Median)
#2. Dispersion (Inter-quartile range)
#3. Skewness (Symmetry of data)

summary(height)
quantile(height, c(0,0.25,0.5,0.75,1))

#Add a title
boxplot(height, main="Boxplot of height")

#Add labels on Y axis
boxplot(height, main="Boxplot of height", ylab= "height in $")

#Add Colour
boxplot(height, main="Boxplot of height", ylab= "height",
        col="Blue")
#Compare two variables
boxplot(cbind(height,weight), main="Boxplot of height",
        las=1, col=c("Blue","Red"))
####################################################


#Generating a sequence in R
####################################################
#Simple sequence
x=2:10 #Generate values from 2 to 10

seq(2,10)#Generate values from 2 to 10
#Syntax of seq
#seq(from, to, by)

#Generate an arithmatic progression
seq(2,10,0.5) #Generate values from 2 to 10 with a difference of 0.5
############################################################

#Generating a repeat of a vector in R
####################################################
#Syntax of rep
#rep(values, times)
rep(1, times=3) #Repeat 1 three times
rep(1:2, times=3)
rep("Ram", times=3)
rep(c("x", "y", "z"), times=3)

#Repeat each element in the vector
rep(1:2, each=3)
rep(c("x", "y", "z"), each=3)
################################################

#Making a correlation matrix
################################################
library(datasets)#Load the inbuilt dataset package
data(EuStockMarkets) #Open EuStockMarkets dataset
EuStockMarkets
class(EuStockMarkets)
#It is a time-series data.

#We need a dataframe for our purpose
#Hence, convert it in dataframe
x=as.data.frame(EuStockMarkets)
str(x) #All variables are numeric



#Make a covariance matrix
cov(x)

#Make a correlation matrix
cor(x)

#Make a matrix of scatter plot
plot(x)
plot(x, main="XYZ")
####################################################

####################################################
#How to round off
####################################################
x=abs(rnorm(5)*4)
x
ceiling(x)     #Round off upside (round to next integer)
#ceiling takes a single numeric argument x and returns a numeric vector
#containing the smallest integers not less than the corresponding elements of x.

floor(x)       #Round off downside
#floor takes a single numeric argument x and returns a numeric vector
#containing the largest integers not greater than the corresponding elements of x.

round(x, digits = 0) 
#This is used most of the time
#Round off some decimal places
#round rounds the values in its first argument
#to the specified number of decimal places (default 0).
round(x, digits = 2) 

##You also can use the round() function to round numbers to multiples of 10, 100, and so on.
#For that, you just add a negative number as the digits argument
#For example
x=sample(500000:700000, 5)

#Round to multiples of thousands
x
round(x, digits = -3)

#Round to multiples of hundreds
x
round(x, digits = -2)
########################################################

########################################################
#Using unique command
########################################################
x=rep(c("A", "B", "C"), 3)
x

#Identify unique letters
unique(x)
length(unique(x))
########################################################
########################################################