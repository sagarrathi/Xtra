// OLS 
Data_File=read.csv(file=file.choose())
View(Data_File)
ols <-lm(PE ~ CEE1+ETA+SIZEA, data=Data_File)
summary(ols)
library(plm)
View(Data_File)
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
summary(fixed)
//F test for choice between OLS and fixed effects
pFtest(fixed, ols)
// Random effects estimation
random <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="random")
summary(random)
// Hausman test for choice between fixed effects and random effects
phtest(fixed, random)
// Choice between random effects and Ols BPLM Test
pool <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="pooling")
summary(pool)
plmtest(pool, type=c("bp"))

// Test for cross sectional dependence
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
pcdtest(fixed, test = c("cd"))

// Wooldridge test for serial correlation
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
pbgtest(fixed)

// Testing for heteroskedasticity
bptest(PE ~ CEE1+ETA+SIZEA+factor(id), data=Data_File)
