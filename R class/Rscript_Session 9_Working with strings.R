################################################################
############# Statistical Programming with R ###################
################################################################

#Session 9
###################################################
## Working with string/character data #############
###################################################
#Start with a single data
x="Sarveshwar Kumar Inani"#It could be a vector as well
#Extract First name and middle name
substr(x,1,16)#Extracting from-to, like left function in Excel (it starts on 1)

#Extract last name
substr(x,18,22)#If you know the number of characters in the word, like right function in R

nchar(x)#Count the characters

substr(x,nchar(x)-5+1,nchar(x))#Task is done, no need to know the numbers apriori

#It works on vector of string as well, as same as it works on simple strings
###############################################################################

###############################################################################
############Important character functions in R#################################
###############################################################################
#1. Concatenate the strings
a="I am"
b="Vijay"
paste(a,b)
paste(a,b, sep="|")#Can separate by some delimiter


#2. Generage a sequence (Ram1, Ram2, ..., Ram20)
paste("Ram", seq(1,20), sep = "")
p=paste("Ram", seq(1,20), sep = "")


paste(c("Ram","Lakhan","XYZ"), rep(seq(1,5),each=3), sep = "")
#May be used to repeat students name subject-wise
paste(c("Ram","Lakhan","XYZ"), rep(c("SPR","ADM"),each=3), sep = "_")

#3. Replace some characters
x="Sarveshwar Kumar Inani"
substr(x, 1, 3)
substr(x, 1, 3) = "Kar" #Replace the Sar to Kar

#4 Replace or substutute some words
x="Sarveshwar Kumar Inani"
sub("Sarveshwar", "Vijay", x) #Like find and replace in Excel




#datasets package in R
#Not necessary to load for using datasets
library(datasets)#Load the package

#Use/load datasets
data("USJudgeRatings")
USJudgeRatings

help("USJudgeRatings")#Mention name of dataset
#Lawyers' ratings of state judges in the US Superior Court.
str(USJudgeRatings)
row.names(USJudgeRatings)
x=USJudgeRatings#Rename to save time
rm(USJudgeRatings)#Remove "USJudgeRatings" file


#Add 13th column for full names
x$names=rownames(x)

#Add one more column for surname only
x$Surnanames=substr(x$names,1, nchar(x$names)-5)
#Some names are having junior, hence, not working


#Or alternatively (Use substitute command and substitute anything after comma by nothing)
sub(",.*", "", x$names) #By 13th column
#If comma is not in the input, the output will be wrong
# Like in 17th element (HEALEY.A.H.), 31st element (SADEN.G.A.)
#Working well (Given your inputs are correct)
###########################################################

#Another example
###########################################################
## get the first names of the members of R-core
#Some code taken from internet
a <- readLines(file.path(R.home("doc"),"AUTHORS"))[-(1:8)][1:21]
a
#It is a perfect input (without any flaw)
##########################
#Get first names
##########################
b=sub(" .*","", a)#sub is a command for substitute
b
#.* is a wild character (select everything)

#we can use the power of sapply
strsplit(a, " ") #The output is a list
sapply(strsplit(a, " "), "[", 1)
#Means, subset second value of each element of the list

#Similary, extract second name
sapply(strsplit(a, " "), "[", 2)
##############################################

#A simpler way to achieve this same result would be to use the
#str_split_fixed function of the stringr package:
library(stringr)
str_split_fixed(a, " ", 2)
#Divide the full name in 2 parts (the third argument)
#Divide by " " (space)
#Select 1 for name and 2 for sirname
str_split_fixed(a, " ", 2)[, 1]#For names
str_split_fixed(a, " ", 2)[, 2]#For surnames
#It is the best one

######################################################
#Pattern matching in R
######################################################

?grep #used for pattern match
#By default arguments
grep(pattern, x, ignore.case = FALSE)

##subset vector by first letter
##Example
vector = c("apple", "banana", "fox", "Actor")
vector
#Extract names starting with a (small letter)
vector[grep("^a.*", vector)]
vector[grep("a.*", vector)]
#^ used for starting
#If you do not put ^, it may select for the match anywhere (not from the beginning)
#or
grep("^a.*", vector)
#grep gives positions of pattern match
#unless you use value = TRUE
grep("^a.*", value = T,vector)

#Extract names starting with A (capital letter)
vector[grep("^A.*", vector)]

#Ignore case
vector[grep("^a.*", ignore.case = T, vector)]
vector[grep("^[aA].*", vector)]

#Other ways
grep("^[a-z]", letters)
grep("[a-z]", letters)
grep("^[a-c]", letters)
########################################

#Find values with certain beginning and closing value
k <- c("J448", "G459", "G479", "K406")  

#Find values starting with G4
k[grep("G4", k)]
#or
k[grep("^G4", k)] #Beginning

#Find values starting with G and ending with 9
k[grep("^G..9", k)]
#. means it could be any letter

#Find values ending with 9
k[grep("^...9", k)]
#######################################

#If values are of different length
k <- c("J448", "G45129", "G41234579", "K406")
#Find values ending with 9
k[grep("^.*9", k)]

#Find values starting with G and ending with 9
k[grep("^G.*9", k)]
##########################################

