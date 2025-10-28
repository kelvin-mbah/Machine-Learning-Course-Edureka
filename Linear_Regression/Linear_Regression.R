#### LINEAR REGRESSION ####

#What is Machine learning? 
      #This is a type of artificial intelligence (AI) that provides 
      #computers with the ability to learn without being explicitly programmed

#What is Regression?
      #Regression analysis is a predictive modelling technique
      # it estimates the relationship between a dependent (Target) and an Independent variable (Predictor)

#There are different types of regression:
# 1. linear regression: when there's a linear relationship between the dependent and independent variable
# 2. logistic regression: when the dependent variable is binary (0/1, true/false, yes/no) in nature
# 3. polynomial regression: when the power of the independent variable is more than 1

# NB: The linear regression model assumes a linear relationship between the input variable and the outcome variable 

#CASE STUDY (Housing data of Boston)----

#Load the dataset and required library
library(MASS)
data("Boston")
?Boston                      #for description of the data


#we will divide our entire dataset into 2 subsets----
#1. Training dataset = to train the model
#2. Testing dataset = to validate and make predictions

set.seed(2)             #helps split the data into 2
library(caTools)        #sample.split function is present in this package

split <- sample.split(Boston$medv, SplitRatio = 0.7)
split                  #we divide the data with the ratio 0.7 (such that 70% will be for training set and 30% for testing set)

training_data <- subset(Boston, split== 'TRUE')
testing_data <- subset(Boston, split== 'FALSE')

#Exploratory analysis ----

#when we have various variables, correlation is an important factor to check the dependencies within themselves
#correlation analysis gives us insight, between mutual relationship among variables

cr <- cor(Boston)       #This gives us the correlation values
library(corrplot)
corrplot(cr, type = 'lower')
corrplot(cr, method= 'number')

#To view the correlation of variables
plot(Boston$crim, Boston$medv, cex = 0.5, xlab = "crime rate", ylab = 'price')

#creating scatter plot matrix
attach(Boston)
library(lattice)
splom(~ Boston[c(1:6,14)], groups = NULL, data = Boston, axis.line.tck = 0, axis.text.alpha = 0)
splom(~ Boston[c(7:14)], groups = NULL, data = Boston, axis.line.tck = 0, axis.text.alpha = 0)


#studying rm and medv
plot(rm, medv)
abline(lm(medv~rm), col = 'red')        #attach regression fit line to the plot


#Variance Inflation factor ----
#VIF measures the increase in variance of an estimated regression coefficient due to multicollinearity

library(car)
model <- lm(medv ~ ., data = training_data)
vif(model)



#Optimize model----
#Here we will be excluding the variable Indus and age 

model <- lm(medv ~ . -age -indus, data = training_data)
summary(model)

#Now lets predict using the model ----

predic <- predict(model, testing_data)
predic

#to compare predicted values and actual values, we can use plots
plot(testing_data$medv, type = 'l', lty =1.8, col= 'green')
lines(predic, type = 'l', col='blue')

#Now we can use this model to predict the output of sample dataset
predic2 <- predict(model, sample_data)
predic
