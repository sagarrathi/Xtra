################################################################
############# Statistical Programming with R ###################
################################################################

#Session 10
###################################################
################ Linear Regression ################
###################################################
data("women")
women

##Bivariate Regression
attach(women)
plot(height, weight)
cor(weight,height)

#Do Regression
lm(weight~height)
Model1=lm(weight~height)

#Write Equation
abline(Model1)#Add trend line

#Compute fitted values
Model1$fitted.values

#Compute residuals
Model1$residuals

#Add a line for mean of weight (assuming slope is 0, no effect of height)
abline(mean(weight),0, col="Red")
abline(-87.52,3.45, col="Blue")

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

##Alternate ways
resid(model_summary)
coefficients(model_summary)

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
###################################################



###################################################
#Diagnostics on residuals
###################################################
#Assumption of normality
x=resid(model_summary)

#Check mean and median
mean(x)
median(x)
#A huge difference exist, Hence not normal

mean(y)
median(y)

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

#Plot QQ plots
plot(Model1) #second plot
par(mfrow=c(2,2)) #Make 4 windows
plot(Model1)

#######################################################
#Assumption of linear relationship
#by plotting residuals vs fitted values
par(mfrow=c(1,1))
plot(Model1$fitted.values,Model1$residuals)

#alternatively
plot(Model1)
#It is not met here
#Some information is still left
##########################################

#Homoscedasticity (The variance of residuals is constant)
plot(height, weight)
abline(Model1)
#The errors are constant around the regression line

#Or we can look at residual vs fitted values
plot(Model1)
###################################


#New example
###################################
data("airquality")
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
#Assumption of linear relationship
#by plotting residuals vs fitted values
par(mfrow=c(1,1))
plot(model_3$fitted.values,model_3$residuals)

#alternatively
plot(model_3)
#It is not met here
#Some information is still left
#########################################


