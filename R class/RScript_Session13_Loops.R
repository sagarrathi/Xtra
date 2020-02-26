################################################################
############# Statistical Programming with R ###################
################################################################

#Session 13
##########################################
################ Loops ###################
##########################################

#Useful in repetitive work
#for and while loops

#for loop (Mostly used)
#############################################

#Start from the simplest
#Example 1
#############################################
#Write "My name is "Name" for each student
Student_name=c("Gaurav", "Rubin", "Kiran", "Vigil")

#for all students
for (i in Student_name){
  print(paste("My name is", i))
}

#for first/last few students
for (i in 1:2){
  print(paste("My name is", Student_name[i]))
}

for (i in 3:length(Student_name)){
  print(paste("My name is", Student_name[i]))
}
#######################################
#You can assign the output to new vector

output=c()#Create a null vector
for (i in 1:length(Student_name)){
  new_output=print(paste("My name is", Student_name[i]))
  output=c(output, new_output)
}

#Or
output=c()#Create a null vector
for (i in 1:length(Student_name)){
  output[i]=print(paste("My name is", Student_name[i]))
}

output
##########################################

#Example:2. count the number of even numbers in a vector
#########################################################
set.seed(1)
x=sample(10:50,10, replace = F)
x
#Take a sample of 10 values from the sequence 10:50 (without replacement)

count = 0#Add a counter to count
for (i in x) {
  if(i %% 2 == 0) count = count+1
}
count

#%% is used to get remainder after the division
#Like if 16 is divided by 7, the remainder is 2
16%%7 #It comes to be 2





#Now you generate a vector of 20 values from the same sample
#and count if values are odd
x=sample(10:50,20, replace = F)
x

count = 0
for (i in x) {
  if(i %% 2 == 1) count = count+1
}
count
#######################################################
###################################################

#Example 3
#loop to square every element of my dataset
x = seq(1, 100, by=2)
x_squared = NULL


for (i in 1:50 ) {
  x_squared[i] = x[i]^2
}
##################
x = seq(1, 100, by=2)
x_squared = NULL

#Use break to come out of the loop
for (i in 1:50 ) {
  if(i>25){
    break()
  }
  x_squared_new = x[i]^2
  x_squared = c(x_squared,x_squared_new)
}



#############################################

##While loops
#Use a logical condition (greater than, less than or equal to)
#No need to mention number of iterations
x=0
while (x<14) {
  print(x)
  x=x+2
}

#It is kind of for loop with some condition
#############################################


##Some use of for loop in making a report
library(moments)

#Get file names
setwd("C:/Users/SARVESHWAR/Desktop/0. JGBS/1. SPR and FAR/SPR_2017-18/PPTs and Course-material/Session 5-14/Agri-commodities")
filenames=list.files()#make a vector of file names
Commodities_vector=substr(filenames, 1, nchar(filenames)-4)

##Loop for Summary statistics starts here
##Create null vectors
spot_mean_begin=NULL
spot_stddev_begin=NULL
spot_CV_begin=NULL
spot_skewness_begin=NULL
spot_kurtosis_begin=NULL
spot_jarquetest_begin=NULL
spot_jarquepvalue_begin=NULL
spot_observations_begin=NULL
futures_mean_begin=NULL
futures_stddev_begin=NULL
futures_CV_begin=NULL
futures_skewness_begin=NULL
futures_kurtosis_begin=NULL
futures_jarquetest_begin=NULL
futures_jarquepvalue_begin=NULL
futures_observations_begin=NULL

for (i in 1:10){
  x= read.csv(filenames[i], stringsAsFactors=FALSE)#It is showing more than 3 columns, hence take only first three columns
  x=x[,c(2:3)]#Only spot, and Futures columns only
  x=log(x)
  spot=diff(x[,1])
  futures=diff(x[,2])
  ######################################################################
  spot_mean=mean(spot)
  spot_stddev= sd(spot)
  spot_CV=spot_stddev/spot_mean #Not in %
  spot_skewness=skewness(spot)
  spot_kurtosis=kurtosis(spot)
  spot_jarque=jarque.test(spot)#Conduct jarque test which returns a list
  spot_jarquetest=spot_jarque$statistic#Jarque test value
  spot_jarquepvalue=spot_jarque$p.value#Jarque test p-value
  spot_observations=length(spot)#No. of observations in returns
  ######################################################################
  ##Then calculations for Futures
  futures_mean=mean(futures)
  futures_stddev= sd(futures)
  futures_CV=futures_stddev/futures_mean
  futures_skewness=skewness(futures)
  futures_kurtosis=kurtosis(futures)
  futures_jarque=jarque.test(futures)#Conduct jarque test which returns a list
  futures_jarquetest=futures_jarque$statistic#Jarque test value
  futures_jarquepvalue=futures_jarque$p.value#Jarque test p-value
  futures_observations=length(futures)#No. of observations in returns
  ###################################################################################
  ##All descriptives are ready, now rbind them
  spot_mean_begin= rbind(spot_mean_begin, spot_mean)
  spot_stddev_begin= rbind(spot_stddev_begin, spot_stddev)
  spot_CV_begin=rbind(spot_CV_begin, spot_CV)
  spot_skewness_begin=rbind(spot_skewness_begin, spot_skewness)
  spot_kurtosis_begin= rbind(spot_kurtosis_begin, spot_kurtosis)
  spot_jarquetest_begin= rbind(spot_jarquetest_begin, spot_jarquetest)
  spot_jarquepvalue_begin= rbind(spot_jarquepvalue_begin, spot_jarquepvalue)
  spot_observations_begin= rbind(spot_observations_begin, spot_observations)
  ######################
  futures_mean_begin= rbind(futures_mean_begin, futures_mean)
  futures_stddev_begin= rbind(futures_stddev_begin, futures_stddev)
  futures_CV_begin=rbind(futures_CV_begin, futures_CV)
  futures_skewness_begin= rbind(futures_skewness_begin, futures_skewness)
  futures_kurtosis_begin= rbind(futures_kurtosis_begin, futures_kurtosis)
  futures_jarquetest_begin= rbind(futures_jarquetest_begin, futures_jarquetest)
  futures_jarquepvalue_begin= rbind(futures_jarquepvalue_begin, futures_jarquepvalue)
  futures_observations_begin= rbind(futures_observations_begin, futures_observations)
  ########################################################################################
}

#cbind all results and make a table and name the columns

Summary_results=cbind(Commodities_vector, spot_mean_begin, spot_stddev_begin, spot_CV_begin,
                      spot_skewness_begin, spot_kurtosis_begin, spot_jarquetest_begin, 
                      spot_jarquepvalue_begin, spot_observations_begin,
                      futures_mean_begin, futures_stddev_begin, futures_CV_begin,
                      futures_skewness_begin, futures_kurtosis_begin, futures_jarquetest_begin, 
                      futures_jarquepvalue_begin, futures_observations_begin)

colnames(Summary_results)=c("Name", "spot_mean", "spot_stddev", "spot_CV", 
                            "spot_skewness", "spot_kurtosis", "spot_jarquetest",
                            "spot_jarquepvalue", "spot_observations",
                            "futures_mean", "futures_stddev","futures_CV", "futures_skewness", 
                            "futures_kurtosis", "futures_jarquetest", 
                            "futures_jarquepvalue", "futures_observations")
##Checked with Eviews, It is flawless and working fine

##save results in csv and xlsx format
setwd("C:/Users/SARVESHWAR/Desktop/0. JGBS/1. SPR and FAR/SPR_2017-18/PPTs and Course-material/Session 5-14/Agri-commodities")
write.csv(Summary_results, file = "Summary_results.csv", row.names = FALSE)
#######################################################################################




#Making graphs of all 10 securities at level of original prices
#Get file names
setwd("C:/Users/SARVESHWAR/Desktop/0. JGBS/1. SPR and FAR/SPR_2017-18/PPTs and Course-material/Session 5-14/Agri-commodities")
filenames=list.files()#make a vector of file names
Commodities_vector=substr(filenames, 1, nchar(filenames)-4)

#Make PDF file of graphs
pdf('agri.pdf', width = 8, height = 11)  ## Device with dimensions of A4 paper
par(mfrow=c(5,2))#Make 5x2 layout to make plots
par(mar=c(3, 2,1.5,1))#set margins, hit and try size fit
par(omi = rep(.3, 4))                      ## 1/2 inch outer margins
for (i in 1:10){
  x= read.csv(filenames[i], stringsAsFactors=FALSE)#It is showing more than 3 columns, hence take only first three columns
  x=x[,c(1:3)]#Date, spot, and Futures columns only
  x[,1]=as.Date(x[,1], format = "%d-%m-%y")#To be converrted in dates, It was in string format
  plot(x[,1], x[,2], type = "l", lty=1, main = Commodities_vector[i], xlab = "Time", 
       ylab = "Prices")#Plot spot
  lines(x[,1], x[,3], type = "l", lty=3)#Add futures
  legend("topleft", names(x[-1]), lty = c(1,3), cex = 0.8)#cex is used to reduce the area of legend on plot
}
dev.off()#pdf is saved in current directory
###################################################
###################################################


set.seed(1)
year=seq(1951,2019)#Generate a year sequence of 69 years
x=data.frame(year)
#Generate random data for 29 states and make a data frame
for (i in 1:29){
  x[,i+1]=sample(70:90,69,replace = T)
}
#Name the columns
colnames(x)=c("YEAR", paste("STATE",seq(1:29),sep = "_"))

#Make Line chart for all states
#Make PDF file of graphs
pdf('Literacy.pdf', width = 8, height = 11)  ## Device with dimensions of A4 paper
par(mfrow=c(8,4))#Make 4X2 layout to make plots
par(mar=c(3, 2,1.5,1))#set margins, hit and try size fit
par(omi = rep(.3, 4))                      ## 1/2 inch outer margins
for (i in 1:29){
  plot(x[,1], x[,i+1], type = "l", main = colnames(x)[i+1])
}
dev.off()#pdf is saved in current directory
#


