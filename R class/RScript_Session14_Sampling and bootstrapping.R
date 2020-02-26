################################################################
############# Statistical Programming with R ###################
################################################################

#Session 14
###################################################
######### Sampling and bootstrapping ##############
###################################################

#####Sampling
#sample takes a sample of the specified size from the elements of x (vector)
#using either with or without replacement

#Syntax 
#sample(x, size, replace = FALSE, prob = NULL)

#Generate a vector of sequence
x <- 10:20

# Take a random permutation
sample(x)
sample(x)
#It gives a random arrangement like resampling of same size as of sample

# bootstrap resampling -- only if length(x) > 1
# Taking a sample out of sample with replacement
# It is used when we have small sample size
# Just need to simulate many times to validate the results
sample(x, replace = TRUE)


#Choose conditional samples
####################################
sample(x[x >  15]) # length 5
sample(x[x > 20]) # length 0

#Other examples
sample(x, 5)
sample(x, 5, replace = T)
sample(x, 100, replace = T)
########################################################

#Sample from a string vector
###########################################################
## get the first names of the members of R-core
#Some code taken from internet
a <- readLines(file.path(R.home("doc"),"AUTHORS"))[-(1:8)][1:21][-21]
a

#Take a random sample of 5 person, without replacement
sample(a, 5)
###################################################


###################################################
############# Simulation in R Studio ##############
###################################################

##very simple bootstrap example
###################################################
##Estimate the 95% confidence interval for the mean of a sample mean
#First, generate a random sample from a normal distribution
set.seed(1)
y <- rnorm(1000, 10, 3)

#sample multiple times using the replicate function to
#get our bootstrap resamples
#Then, compute the relevant quantiles
sample(y, replace = TRUE)
mean(sample(y, replace = TRUE))
replicate(1000, mean(sample(y, replace = TRUE)))#Gives 1000 mean values

#Get desired quantiles
quantile(replicate(1000, mean(sample(y, replace = TRUE))),
         probs = c(0.025, 0.975))
####################################################################



##Example 2 for simulation
####################################################
#Repeat a task many times
coin=c("Head", "Tail")
set.seed(1) #To make results reproducible
y=sample(coin, 10, replace = TRUE) #Take a sample of 10
length(y[y=="Head"])#Count head, should be five

#Do it 100 times
replicate(100, sample(coin, 10, replace = TRUE))
a=replicate(100, sample(coin, 10, replace = TRUE))

#Count thr number of heads in each round
Head_count=c()
for (i in 1:ncol(a)){
  y=a[,i]
  Head_count[i]=length(y[y=="Head"])#Count head, should be three
}
Head_count
mean(Head_count)
#Coin is unbiased, which is quite obvious here
###################################################



## Central Limit Theorem
#################################################
#The distribution of sample mean is always normal
#Given that the sample size is large enough (more than 30 as per literature)
############################################
################################################
##First consider a normal distribution with mean 5 and sd 6 
#The population distribution~N(5,6)
#Take 100 samples of same size (n=100)
set.seed(1)# You can replicate the same results from resampling, 
#any arbitrary number

rnorm(100, 5, 6)#Take 100 values
mean(rnorm(100, 5, 6))
#Use replicate command to repeat 100 (n) times
a=replicate(100, mean(rnorm(100, 5, 6)))
mean(a)
sd(a)#Equals 6/sqrt(100)=0.6 [Also called standard error]
hist(a)
#Invoke CLT Sample distribution~N(5, 6/sqrt(sample size))
#Use Jarque-Bera test for normality
library(moments)
jarque.test(a)
###############################################
###############################################
