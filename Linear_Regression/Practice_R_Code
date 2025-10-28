# Linear Regression on Boston Housing Dataset
# Goal: Predict house prices (medv) based on features like crime rate, rooms, etc.

# Load libraries first
library(MASS)  # For Boston dataset
library(caTools)  # For splitting data
library(corrplot)  # For correlation plots
library(lattice)  # For splom
library(car)  # For VIF

# Load dataset
data("Boston")
?Boston  # View description

# Split data: 70% training, 30% testing
set.seed(2)  # For same results every time
split <- sample.split(Boston$medv, SplitRatio = 0.7)
training_data <- subset(Boston, split == TRUE)
testing_data <- subset(Boston, split == FALSE)

# Exploratory analysis
# Correlation matrix
cr <- cor(Boston)
png("Visualizations/corrplot_lower.png")  # Save plot
corrplot(cr, type = 'lower')
dev.off()
png("Visualizations/corrplot_numbers.png")  # Save another
corrplot(cr, method = 'number')
dev.off()

# Scatter plot: Crime rate vs Price
png("Visualizations/crim_vs_medv.png")
plot(Boston$crim, Boston$medv, cex = 0.5, xlab = "Crime Rate", ylab = "Price")
dev.off()

# Scatter plot matrix (splom)
attach(Boston)
png("Visualizations/splom_1-6.png")
splom(~ Boston[c(1:6,14)], groups = NULL, data = Boston, axis.line.tck = 0, axis.text.alpha = 0)
dev.off()
png("Visualizations/splom_7-14.png")
splom(~ Boston[c(7:14)], groups = NULL, data = Boston, axis.line.tck = 0, axis.text.alpha = 0)
dev.off()

# RM vs MEDV with regression line
png("Visualizations/rm_vs_medv.png")
plot(rm, medv)
abline(lm(medv ~ rm), col = 'red')
dev.off()

# Variance Inflation Factor (VIF) for multicollinearity
model <- lm(medv ~ ., data = training_data)
vif(model)

# Optimize model: Exclude age and indus
model <- lm(medv ~ . -age -indus, data = training_data)
summary(model)

# Predict on testing data
predic <- predict(model, testing_data)
predic

# Plot actual vs predicted
png("Visualizations/actual_vs_predicted.png")
plot(testing_data$medv, type = 'l', lty = 1.8, col = 'green', main = "Actual vs Predicted", xlab = "Index", ylab = "Price")
lines(predic, type = 'l', col = 'blue')
dev.off()

# Example prediction on sample data (replace with your own)
sample_data <- data.frame(crim = 0.1, zn = 20, chas = 0, nox = 0.5, rm = 6, dis = 3, rad = 5, tax = 300, ptratio = 18, black = 390, lstat = 10)
predic2 <- predict(model, sample_data)
predic2
