data("women")
women
attach(women)
plot(height,weight)
cor(weight,height)

lm(weight~height)
model1=lm(weight~height)
model1
abline(model1)

model1$fitted.values

model1$residuals

###time series data-over a period of time.....cross sectional-at a particular point of time...
#### panel data(lonitudinal data) is combination of both
### Fixed asset model,random effects model,pooled ols (ordinary least square)

### fixed asset is done on variables which change over time
### assumption of random effect is cov(x,a) not = 0
###install lmtest
## ols
ols = lm(PE ~ CEE1+ETA+SIZEA, data = Data_File)
summary(ols)
library(plm)
View(Data_File)
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
summary(fixed)
##F test for choice between OLS and fixed effects
pFtest(fixed, ols)   ## fixed effect is appropriate
## Random effects estimation
random <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="random")
summary(random) 
## Hausman test for choice between fixed effects and random effects
phtest(fixed, random) ## NUll: random effect is apprpriate
# Nul is rejected
## Choice between random effects and Ols BPLM Test
pool <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="pooling")
summary(pool)
plmtest(pool, type=c("bp"))

##// Test for cross sectional dependence
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
pcdtest(fixed, test = c("cd"))

##// Wooldridge test for serial correlation
fixed <- plm(PE ~ CEE1+ETA+SIZEA, data=Data_File, index=c("id", "year"), model="within")
pbgtest(fixed)

##// Testing for heteroskedasticity
bptest(PE ~ CEE1+ETA+SIZEA+factor(id), data=Data_File) # Null: Homo

# Reject Null, Hetroscadisticity present



## Unit root
# Page no. 22 in pricenton pdf

Panel.set <- plm.data(fixed,index=c("id", "year"))
library(tseries)
adf.test(Panel.set$y, k=2)
install.packages("tseries")






