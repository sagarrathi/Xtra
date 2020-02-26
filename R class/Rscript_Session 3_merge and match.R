################################################################
############# Statistical Programming with R ###################
################################################################


#Session 3
###################################################
#### Merge data across data bases #################
###################################################
#Set working directory and Import these files
#Different files of Reliance Industries
close_price <- read.csv(file.choose())
number_trades <- read.csv(file.choose())
trade_quantity <- read.csv(file.choose())

#Make a single file "x" that contains closing price and trade quantity
#we can use merge command
x=merge(close_price, trade_quantity, by.x = "Date", by.y = "Date")
#or 
x=merge(close_price, trade_quantity, by = "Date")#Column names are same in both dataframe
str(x)
x2=cbind(close_price, trade_quantity)
#Here explain all.x, all.y, FALSE(by default)

#Now merge x to number_trades
x1=merge(x, number_trades, by = "Date")
#Desired output is ready.

##Now make new databases to understand better
close_price1=close_price[1:10,]#First 10 rows only
number_trades1=number_trades[6:15,]

#Now merge close_price1 and number_trades1
x2=merge(close_price1, number_trades1, by = "Date")#Column names are same in both dataframe
########################
########################

##Case 3: Authors and Books (from R itself)
#Clean the slate
authors <- data.frame(
  surname = c("Tukey", "Venables", "Tierney", "Ripley", "McNeil"),
  nationality = c("US", "Australia", "US", "UK", "Australia"),
  deceased = c("yes", rep("no", 4)))

books <- data.frame(
  name = c("Venables","Tukey",  "Tierney",
           "Ripley", "McNeil", "Joseph"),
  title = c("Exploratory Data Analysis",
            "Modern Applied Statistics",
            "LISP-STAT",
            "Spatial Statistics", 
            "Interactive Data Analysis",
            "An Introduction to R"))



m2 <- merge(authors, books, by.x = "surname", by.y = "name")##Exactly vlookup from different dataframes
m21 <- merge(books, authors, by.x = "name", by.y = "surname")##Reverse order
m3=merge(authors, books, by.x = "surname", by.y = "name", all = TRUE)##non-matching cases will be added as well for both
m4=merge(authors, books, by.x = "surname", by.y = "name", all.x = TRUE)##non-matching cases will be added as well for df1 only
m5=merge(authors, books, by.x = "surname", by.y = "name", all.y = TRUE)##non-matching cases will be added as well for df2 only


## example of using 'incomparables'
x <- data.frame(k1 = c(NA,NA,3,4,5), k2 = c(1,NA,NA,4,5), data = 1:5)
y <- data.frame(k1 = c(NA,2,NA,4,5), k2 = c(NA,NA,3,4,5), data = 1:5)
m1=merge(x, y, by = c("k1","k2")) # merging with two columns, and NA's match
#by = c("k1","k2") means when k1 and k2 are identical in both databases

m2=merge(x, y, by = "k1") # NA's match, so 6 rows
m21=merge(x, y, by = "k1",incomparables = NA) # NA's match, so 6 rows
m3=merge(x, y, by = "k2", incomparables = NA) # 2 rows
#########################
#########################


##### match function

#Now we would move to match function
#Match function is helpful to match/merge a certain column, not the entire database
##Match Function
##Matching dates in spot and futures prices
##As simple as index and match function or Vlookup in Excel

#First, Import required files (spot and futures prices)
Crude_spot <- read.csv(file.choose())
Crude_Futures <- read.csv(file.choose())

#Match gives relative position of the date
match(Crude_spot$Date,Crude_Futures$Date)#Ensure Dates are in same format in both files
match(Crude_spot$Date,Crude_Futures$Date)[1:5]#See, first five entries only

#Extract by square brackets
Crude_Futures$Futures.Price[match(Crude_spot$Date,Crude_Futures$Date )]

#Creating new variable
Crude_spot$futures=Crude_Futures$Futures.Price[match(Crude_spot$Date,Crude_Futures$Date )] 

#Get rid of NAs by function complete case
Crude_spot_final= Crude_spot[complete.cases(Crude_spot),]
#or
Crude_spot_final= na.omit(Crude_spot)
##For any data

#Now you do the same thng for volume variable in futures market
############################################
############################################


##  Subsetting of data in R
#Import Bhavcopy of all SSFs
Bhavcopy_all_SSF <- read.csv(file.choose())#Import Bhavcopy_wholedata_FUTSTK

#Task 1: Make a file/data frame for ACC company only
ACC=subset(Bhavcopy_all_SSF, Bhavcopy_all_SSF[,2]=="ACC")#Subset for ACC only

#Task 2: Make a file/data frame for the date 20120102 only
df_20120102=subset(Bhavcopy_all_SSF, Bhavcopy_all_SSF[,1]==20120102)

#Similarly for expiry date and other variables
######################################################

#Now subset for greater than or less than situations
#ACC dataframe inclused data for ACC for 741 days

#make a dataframe of days
#when Trdqty is less than average Trdqty
ACC_below_average=subset(ACC,ACC$Trdqty<mean(ACC$Trdqty))

#Make a dataframe when Trdqty is greater than average Trdqty
ACC_above_average=subset(ACC,ACC$Trdqty>mean(ACC$Trdqty))
#You can also select specific columns in output
ACC_above_average=subset(ACC,ACC$Trdqty>mean(ACC$Trdqty), select = c(1,10:12))
#Or by column names directly
ACC_above_average=subset(ACC,Trdqty>mean(Trdqty))


#Similarly practice for other variables
####################################################

#Now subset with and and or arguments
#Subset ACC when Trdqty is less than average Trdqty and
#Number_trades is also less than average
ACC_below_average=subset(ACC,ACC$Trdqty<mean(ACC$Trdqty) &
                           ACC$Number_trades<mean(ACC$Number_trades))
#Use & for and argument
#Use | for or argument
ACC_below_average=subset(ACC,ACC$Trdqty<mean(ACC$Trdqty) |
                           ACC$Number_trades<mean(ACC$Number_trades))
#Similarly we can subset for any number of variables at a time

##################################################
#Sort, rank functions
#For a vector
x=as.numeric(Bhavcopy_all_SSF[1:10, 13])
class(x)
sort(x)#By deafault ascending

sort(x, decreasing = T)#Descending order
#Or
rev(sort(x))#Reverse order

#Rank gives rank or position
rank(x)
y=rank(x) #Rank in ascending order
z=data.frame(x,y)
########################
y1=rank(-x)#Rank in descending order
z=data.frame(x,y,y1)
#########################

#Make a new dataframe
y=Bhavcopy_all_SSF[1:5, c(2,11:13)]
?sort
#the result of sort() is a sorted vector consisting of elements 
#of the original (unsorted) vector
?order
#order() gives a vector with the ordered indices of the original (unsorted) vector
#It first sorts the vector by values and than gives their position number in unsorted vector
#Sort based on company name (alphabetically)

y[order(y$Symbol,decreasing = T),]

#Sort based on Trdqty
y[order(y$Trdqty,decreasing = T),]


#One more example (Source: https://stackoverflow.com/questions/12289224/rank-and-order-in-r)
set.seed(1)
x <- sample(1:50, 5) 
x
sort(x)
rank(x)
order(x)
x[order(x)]#Like sort()

#Similarly for others
################################################
#In the next session we will learn about dplyr package
##################################################
##################################################
