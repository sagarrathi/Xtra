################################################################
############# Statistical Programming with R ###################
################################################################

#Session 12
###################################################
################ Hypothesis Testing ###############
###################################################

#Explain the t-test
#One-sided and two-sided t-test
#Population mean and sample mean
#Population std deviation and sample standard deviation

#Example of one-sample t-test
##################################################
#The mean tariff of a hotel room in New York is $168 per night (Population mean)
#Sample of 25 hotels, Mean is $172.50 with standard deviation $15.40

#Compute t-test, for 5 % significance level
#Alternate Hypothesis are as follows:
#Right-tail: The mean tariff of a hotel room in New York is more than $168 per night
#Left-tail: The mean tariff of a hotel room in New York is less than $168 per night
#Two tail: The mean tariff of a hotel room in New York is not $168 per night.

#T-test, computed value
(172.50-168)/(15.40/sqrt(25))
#Computed Value of Test Statistic = 1.461039

#The critical value at 5% for one-tail is
#Syntax qt(1-level of significance(5%), degree of freedom (n-1))
qt(0.95, 24)
qt(0.05, 24)

qt(0.975, 24)
#Critical vaule is 1.710882

#Since the computed value is less than critical value
#Cannot reject the null
#Infer that mean tariff of a hotel room in New York is not more than $168 per night
########################

#Two tail: if the mean tariff of a hotel room in New York is not $168 per night.

#T-test, computed value
(172.50-168)/(15.40/sqrt(25))
#Computed Value of Test Statistic = 1.461039

#The critical value at 5% for one-tail is
#Syntax qt(1-level of significance(5%), degree of freedom (n-1))
qt(0.975, 24)
#Critical vaule is 2.063899

#Since the computed value is less than critical value
#Cannot reject the null
#Infer that mean tariff of a hotel room in New York is $168 per night (statistically no difference between sample and population mean)
###########################################
#It was critical value approach

#We can use p-value approach as well (0.05 p-value)
#One-tail p-value
#Syntax pt(-abs(computed t-test value),degree of freedom)
pt(-abs(1.461039),24) #pt gives cumulative distribution function
#Hence, put - sign to get probability (Explain by PDF and CDF)

pt(abs(1.461039),24)
1-pt(abs(1.461039),24)


#Two-tail p-values
2*pt(-abs(1.461039),24)

#In both cases, cannot reject Null as p-value is more than 0.05
##################################################

#Now a numerical example
#Do one-sample t-test in R
# Raw dataset -- 32 observations
data = c(21.75, 18.0875, 18.75, 23.5, 14.125, 16.75, 11.125, 11.125, 14.875, 15.5, 20.875,
         17.125, 19.075, 25.125, 27.75, 29.825, 17.825, 28.375, 22.625, 28.75, 27, 12.825, 
         26, 32.825, 25.375, 24.825, 25.825, 15.625, 26.825, 24.625, 26.625, 19.625)

# Student t-Test
t.test(x=data, mu=10, conf.level=0.95)

# Manually calculate p-value
t.value = (mean(data) - 10) / (sd(data) / sqrt(length(data)))
#Two-tail p-values
p.value=2*pt(-abs(t.value),df=length(data) - 1)
#########################################################

#By default t.test function arguments
t.test(x, y = NULL, alternative = c("two.sided", "less", "greater"), mu = 0, paired =
         FALSE, var.equal = FALSE, conf.level = 0.95)
#two.sided is default alternative
#########################################################

#Example with Lungcapacity dataset
x=read.csv(file.choose())
attach(x)
########################
#One-sided t-test at 95% confidence
#Suppose we test the claim that mean Lungcapacity is <8 (H1)
#H0: Mean>=8    H1: Mean<8

t.test(Lung.Capacity,mu =8, alternative = "less", conf.level = 0.95)
#Reject the null, infer that true mean is less than 8
##################################

########################
#Two-sided t-test at 95% confidence
#Suppose we test the claim that mean Lungcapacity is not equal to 8
#H0: Mean=8    H1: Mean!=8

t.test(Lung.Capacity,mu =8, alternative = "two.sided", conf.level = 0.95)
t.test(Lung.Capacity,mu =8,conf.level = 0.95)
#Reject the null, infer that true mean is not 8
##################################
#Assign to an object
T_test=t.test(Lung.Capacity,mu =8,conf.level = 0.95)

#Extract desired values
T_test$statistic
T_test$p.value

#####################################################
#####################################################

#Two-sample t-test
#Examine the differences of two sample means
#Compare the Lung capacity of smokers vs non-smokers
class(Smoke)

boxplot(Lung.Capacity~Smoke)#Compare the means
#Conduct two-sided t-test
#H0: Mean lung capacity of smokers and non-smokers is equal
#H1: There is a difference
t.test(Lung.Capacity~Smoke,conf.level = 0.95)
#So can not reject the null and infer that there is no difference in Lung capacity

#Rather than using ~
t.test(Lung.Capacity[Smoke=="No"],Lung.Capacity[Smoke=="Yes"],conf.level = 0.95)

##############################
#Now do t-test for Lung capacity of males and females
t.test(Lung.Capacity~Gender,conf.level = 0.95)
#So can not reject the null and infer that there is no difference in Lung capacity
##############################
################################################

#Paired t-test
#Compare before and after situation
before=c(10,15,18,20,25,30,32,36,15,18)
after=c(12,18,21,20,22,32,36,30,20,19)
#There is no impact
t.test(before,after,paired = T,conf.level = 0.95)
#####################################################