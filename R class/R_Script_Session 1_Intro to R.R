################################################################
############# Statistical Programming with R ###################
################################################################

getwd()
##Session 1

#How to create an object
#R is an object oriented language
#Different types of data can be generated in R
# Generate objects using Assignment Operator which is <- or =
#For example
x<-5
y=5

#Assign some output in x
x=5*6+2 #R is a dynamic language
x=6+5
#It replaces the old values of the objects with new one

#We can generate different types of structures in R 
#For Example vector, matrix, dataframe, list 
#########################################################


#########################################################
#####How to Generate vectors in R studio#################
#########################################################
#First clean the slate using rm(list = ls()) command in console
rm(list = ls())

Marks_R=c(5,6,9)
Names_R=c("R", "Vivek", "X")
Status_R=c(T,F,T)

#Vector is an object in R
#c() is used for generating vectors
#c stands for combine (combine values to make a vector)
#diffrerent types of vectors could be generated in R
#For example
x=c(5,6,9,10)#A numerical vector with 4 observations or elements
#All obs must be of same type (numeric, character, or logical)

y=c("Ram", "Shyam", "Sam", "Thomas")#A character vector with 4 observations or elements
#We will discuss all types of vectors in next video

#These vectors can be combined to make a matrix or dataframe
#with the help of cbind (column bind command)
z=cbind(x,y)#Makes a matrix
REsult_R
is.matrix(z)

z
str(z)
class(z)#What kind of object it is

##Make a dataframe
z=data.frame(x,y)#Makes a matrix (Coercion to character data)
is.matrix(z)
z
str(z)
class(z)#What kind of object it is

#The difference between matrix, dataframe, or list structures
#############################################################


###############################################################
########Types of data in R studio or atomic vectors############
###############################################################
#First clean the slate using rm(list = ls()) command in console
rm(list = ls())

#Numeric
x=c(5.2,6.99,9.032,10)
#Verify the type using class(vector name) command
class(x)

#Character
x1=c('Ram', 'Shyam', 'Sam', 'Thomas') #Use inverted commas (sigle or double quotations)
class(x1)

#Logical or Boolean
x2=c(TRUE, FALSE) #Do not add inverted commas otherwise it will be character vector
class(x2)

#Integer
x3=c(5L,6L,9L,10L) #Use L for every number
class(x3)

#Complex
x4=c(3 + 2i, 5 + 3i)
class(x4)
###############################################################


###############################################################
########How to do vector operations/ vectorization in R########
###############################################################
#First clean the slate using rm(list = ls()) command in console
rm(list = ls())

#Add a scalar (single value) in each element of vector
#We can add, subtract, multiply, divide, or any operation on a vector
#For example
x=c(5,6,9,10)

#Add 5 to each element, and make a new vector y
y=x+5

#subtract 5 from each element, and make a new vector y1
y1=x-5

#multiply each element from 2, and make a new vector y2
y2=x*2

#divide each element from 2, and make a new vector y3
y3=x/2

#Take log of each element, and make a new vector y4
y4=log(x) #Natural log

#Take square root
sqrt(x)

#Do squares, or any exponent
x^5

##So we can do any vector operation for each element
#of a vector easily

#We can do element to element operations in 
#vectors of same length
#+,-,*,/, or any operation
x
y
z=x+y
#Similarly other operations could be done easily
###################################################


###################################################
####Vector, Matrix, Dataframe, List################
####The basic data structures/objects in R#################
###################################################
#Vector/Column/Variable
x=c("Ram","Shyam")#Character vector
x1=c("Ram","Shyam", "Sam", "Thomas")#Character vector
y=c(5,6,9,4) #Numeric vector

#Matrix
#A matrix is a two-dimensional data structure. 
#All the elements of a matrix must be of the same type (numeric, logical, character). 
#You can create a matrix with the matrix() command
#a combination of equal length same type vectors
mat_A=matrix(1:10,nrow = 5,ncol = 2)
is.matrix(mat_A)#Verify
dim(mat_A)#Rows, columns
nrow(mat_A)
ncol(mat_A)
length(mat_A) #Total observations (rows*columns)

#We use matrix for numeric data to conduct
#Matrix operations (linear algebra)
#To conduct loops and codes
#Matrix consumes less memory as compared to dataframes
#codes are more efficient for matrices
#The length should be same for all variables/columns in matrix/dataframe 
#Matrix are necessity to do linear algebra operations
#matrix are not very much different from dataframe


#dataframe
#It has features of both matrix and list
# a dataframe is a list of equal-length vectors of different data types
df_A=data.frame(x1,y)
is.data.frame(df_A)#Verify
dim(df_A)#Rows, columns
names(df_A)
nrow(df_A)
ncol(df_A)
length(df_A)#No. of columns

#Mostly used structure in R
#Can contain different types of data (Numeric, character)
#But one column should contain same data type
#The columns of dataframe can be accessed by name using $ sign
df_A$x1
df_A$y
df_A$y

yog=df_A$y
#List
#Most powerful structure for looping, output storage
#It is like dataframe of dataframe
#A dataframe of different length vectors of any type

list_A=list(x,x1,y)
is.list(list_A)#verify
#access elements of list using[[]]

list_A[[1]]#first component
list_A[[1]][1]#first element of first component
list_A[[3]]
list_A[[3]][4]
###################################################


#Matrix functions
##########################################
mat_A=matrix(1:10,nrow = 5,ncol = 2, byrow = T)
is.matrix(mat_A)#Verify
dim(mat_A)#Rows, columns
nrow(mat_A)
ncol(mat_A)
length(mat_A) #Total observations (rows*columns)

#We use matrix for numeric data to conduct
#Matrix operations (linear algebra)
#To conduct loops and codes
#Matrix consumes less memory as compared to dataframes
#codes are more efficient for matrices
#The length should be same for all variables/columns in matrix/dataframe 
#Matrix are necessity to do linear algebra operations
#matrix are not very much different from dataframe


###################################################
#### Matrix operations in R Studio ################
###################################################
#Matrix operations are very helpful
#Generate a matrix
matrix(5:10,2,3)#A 2x3 matrix

#Generate a matrix, row-wise
matrix(5:10,2,3, byrow = T)#A 2x3 matrix

#Generate identity matrix
diag(3)#of order 3

#Make a diagonal matrix
diag(c(5,6,9))

#Now move to other computations
#Suppose we have two matrices
x=matrix(5:10,2,3)#A 2x3 matrix
y=matrix(5:10,3,2)#A 3x2 matrix

#Transpose of x
x
t(x)

#addition of matrix, element to element operation
z=y+t(x) #Dimensions must be same

#subtraction of matrix
z=y-t(x) #Dimensions must be same

#Matrix multiplication
z=x%*%y #columns in x and rows in y should be identical

#Compute inverse of square matrix
solve(z)
#####################################################
#####################################################