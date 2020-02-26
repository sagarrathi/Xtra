################################################################
############# Statistical Programming with R ###################
################################################################


#Session 2
###################################################
####How to import data in R Studio#################
###################################################
#Go to Import Dataset 
#Now you can view your file by clicking on it

#First, import csv file by import Dataset and name the file as y
#Check data structure
str(y)#Gives brief summary of data
#Mostly it is a dataframe

#Read the file by command by giving path/address
y <- read.csv("C:/Users/SARVESHWAR/Desktop/0. JGBS/1. SPR and FAR/1. Statistical Programming in R_Old/PPTs and Course-material/Session 2/Lung Cap_Random_csv.csv")
str(y)#Gives brief summary of data

#One more way
y <- read.csv(file.choose())
###########################################



# Now import xls/xlsx file (First, learn how to import package)
########################################################
#How to install/load/unload/remove packages in R Studio#
########################################################
#R has hundreds of packages suited to different needs
#You can use as per your needs

#Install, "openxlsx" package
#Install it from Packages tab in Files window #Or write
install.packages("openxlsx")

#Use library command after installation to load the package
library(openxlsx)

#unload package after use
detach("package:openxlsx", unload=TRUE)
#You can remove the extra packages
#Go to packages check undesired and remove
#by clicking on cross button
###################################################
###################################################

#Read.xlsx file
Rel=read.xlsx("C:/Users/SARVESHWAR/Desktop/0. JGBS/1. SPR and FAR/1. Statistical Programming in R_Old/PPTs and Course-material/Session 2/RELIANCE_Bhavcopy_xlsx.xlsx", colNames = T)
#Or
Rel=read.xlsx(file.choose(), colNames = T)

#Copy from excel and paste in R
#Just open excel file and select all data and copy it
#After that use the command below
df1=read.table("clipboard", header = T)#Remove empty column (Flag)



#Read.csv is command to import csv (comma separated values) text files
#But you can use read.table command as well
#You can use other text files

#Now, read txt file (which is delimited by "|", i.e. pipe)
x=read.table(file.choose(), sep = "|", header = F)
##########################
##########################


#How to work on data
#See the first 6 entries using head command
x=RELIANCE_Bhavcopy_xls
head(x)
head(x,8)

#See the last 6 entries using tail command
tail(x)
tail(x,10)

###################################################
#### How to extract from vector/Matrix/dataframes##
###################################################
Samyak=RELIANCE_Bhavcopy_xls$Close
Samyak[3]
x=y$Lung.Capacity
#x is a vector

#Extract nth element from a vector using square brackets
x=z
x[2] #Second element
x[c(2,3,6)] #many elements at one click
x[c(2:20)] #Extract sequence
x[c(2:6,8)]
x[c(3,5,9)]#Extract irregular elements
x[x>8] #greater than 9 values
x[x<8] #Less than values
x[x==8] #equal to 9 values


#You can exclude some values by using negative sign
z=x[-3] #Remove third element and generate z vector
x[-3]
x[-c(2,3,6)] #many elements at one click
x[-c(2:6)] #Extract sequence
x[-c(2:6,8)]
x[-c(3,5,9)]#Extract irregular elements


##Extract from matrix/dataframes
############################################
library(openxlsx)
x=read.xlsx(file.choose(), colNames = T)

#Extract i,j value
x[1,3]

#Extract first row
x[1,]

#Extract second column
x[,2]

#Same for matrix and dataframe
#Use [[]] to extract from list
###################################################

###################################################
####How to export files from R Studio##############
###################################################
#Mention output file x
#Now set working directory and export
write.xlsx(x,file = "file_x.xlsx") #Export as xlsx file
write.csv(x,file = "file_x.csv", row.names = FALSE)#Export as csv file
write.table(x,file = "file_x", sep = ",")#Export as text file
###################################################



###################################################
####Basic Statistical functions in R Studio########
###################################################
#Import your file
library(openxlsx)
x=read.xlsx(file.choose(), colNames = T)

#Compute mean for the variable Traded quantity in the file
mean(x$Trdqty) #By name
mean(x[,8])   #By column number

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

#Compute quantile
quantile(x$Trdqty, 0.25)
quantile(x$Trdqty, 0.75)
#Compute descriptive summary
summary(x$Trdqty)
###################################################


#Using help in R

?mean #Taking help for a function
help(mean)#Taking help for a function
example("mean")#Taking help for a function
??mean #Search all packages for mean
########################################
########################################
