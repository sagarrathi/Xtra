################################################################
############# Revision of basic commands in R ##################
################################################################

#Vector is an object in R
#c() is used for generating vectors
#c stands for combine (combine values to make a vector)
#diffrerent types of vectors could be generated in R
#For example
x=c(5,6,9,10)#A numerical vector with 4 observations or elements
#All obs must be of same type (numeric, character, or logical)
y=c("Ram", "Shyam", "Sam", "Thomas")#A character vector with 4 observations or elements


#These vectors can be combined to make dataframe
z=data.frame(x,y)
z
str(z)#See the structure of dataframe
class(z)#What kind of object it is
is.data.frame(z)#Verify
dim(z)#Rows, columns
names(z) #Shows column names
nrow(z) #Number of rows
ncol(z) #Number of columns
#The columns of dataframe can be accessed by name using $ sign
z$x
#Assignment of a column to some other variable
a=z$y


# Import csv/xls/xlsx file
#Import Lung Cap_Random_csv file from Import dataset tab
#Import RELIANCE_Bhavcopy_xlsx file from Import dataset tab


#How to work on data
#See the first 6 entries using head command
x=RELIANCE_Bhavcopy_xlsx #Assign Reliance to x
head(x)
head(x,10)

#See the last 6 entries using tail command
tail(x)
tail(x,10)

#Extract i,j value
x[1,3] #Element in First row and third column

#Extract first row
x[1,]

#Extract second column
x[,2]

#Basic Statistical functions in R Studio
#Compute mean for the variable Traded quantity in the file
mean(x$Trdqty)

#Compute median
median(x$Trdqty)

#Compute minimum value
min(x$Trdqty)

#Compute maximum value
max(x$Trdqty)

#Compute range
range(x$Trdqty)

#Compute standard deviation
sd(x$Trdqty)

#Compute variance
var(x$Trdqty)

#Compute covariance
cov(x$Trdqty, x$Number_trades)

#Compute correlation
cor(x$Trdqty, x$Number_trades)

#Compute descriptive summary
summary(x$Trdqty)


###################################################
################ Linear Regression ################
###################################################
library(datasets)
data("women")#Import inbuilt dataset "women
women

help(women) #To see what is there in the file
##Bivariate Regression
attach(women) #So that columns of women file can be read directly
plot(height, weight)
cor(weight,height)

#Do Regression
lm(weight~height)
Model1=lm(weight~height)#Assign model

#Write Equation
abline(Model1)#Add trend line

#Compute fitted values
Model1$fitted.values
Model1$residuals
Model1$coefficients
Model1$fitted.values
Model1$coefficients

#Compute residuals
Model1$residuals


#See the desired outputs (coefficients and p-values)
#First, see the output
model_summary=summary(Model1)
names(model_summary)

#Now extract
model_summary$call #The Model
model_summary$residuals
model_summary$coefficients
model_summary$coefficients[1,1] #Extract element
model_summary$df
model_summary$r.squared
model_summary$adj.r.squared#Adjusted R-square
model_summary$fstatistic[1]
pf(model_summary$fstatistic[1],model_summary$fstatistic[2],model_summary$fstatistic[3],lower.tail=FALSE)#p-value of F-statistics


#Predict based on known values
#Syntax(model name, name of the dependent variable in data.frame)
predict(Model1, data.frame(height=60))
#119.4833 (-87.516+3.45*60)

#Predict for more than one value
predict(Model1, data.frame(height=c(60,70,80)))
(-87.516+3.45*60)
(-87.516+3.45*70)
(-87.516+3.45*80)

###################################################
#Diagnostics on residuals
###################################################
#Assumption of normality
x=resid(model_summary)

#Check mean and median
mean(x)
median(x)
#A huge difference exist, Hence not normal


hist(x)
boxplot(x)
shapiro.test(x) #Shapiro-Wilk normality test
#Null hypothesis: Data is normal
#Works when we have large number of datasets

#Jarque-Bera test
require(normtest)
jb.norm.test(x)

#Check by random numbers those are normal
set.seed(1)
y=rnorm(1000)
jb.norm.test(y)
#Null hypothesis: Data is normal
#joint hypothesis of the skewness being zero and the excess kurtosis being zero

#######################################################

#Homoscedasticity (The variance of residuals is constant)
plot(height, weight)
abline(Model1)
#The errors are constant around the regression line
###################################


#New example for mulple linear regression
###################################
data("airquality")#Import inbuilt dataset of "airquality"
airquality
help(airquality)
#See the characteristics of data by plotting
attach(airquality)
plot(airquality)


#Run the regression, a general model of all possible variables
lm(Ozone~Solar.R+Wind+Temp+Month+Day)
#Assign to an object
model_2=lm(Ozone~Solar.R+Wind+Temp+Month+Day)
summary(model_2)


#Run new model removing the effect of Days
model_3=lm(Ozone~Solar.R+Wind+Temp+Month)
summary(model_3)

###################################################
#Diagnostics on residuals
###################################################
#Assumption of normality
x=resid(model_3)

#Check mean and median
mean(x)
median(x)
#A huge difference exist, Hence not normal

hist(x)
boxplot(x)
shapiro.test(x) #Shapiro-Wilk normality test
#Null hypothesis: Data is normal
#Works when we have large number of datasets

#Jarque-Bera test
require(normtest)
jb.norm.test(x)
#Null hypothesis: Data is normal
#joint hypothesis of the skewness being zero and the excess kurtosis being zero
#######################################################