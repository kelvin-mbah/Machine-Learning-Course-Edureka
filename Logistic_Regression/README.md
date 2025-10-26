# Logistic Regression
This is my first ML practical in R.

- Code file: machine_learning.R
- Dataset: mtcars (built-in in R)
- Results: Accuracy 83% at 0.5, 92% at 0.7
- Plot: See Rplot-Real.png in Visualizations


# Logistic Regression Notes

- Logistic regression is for yes/no predictions (binary).
- We used mtcars data to predict if a car has V/S engine (vs = 1 or 0).
- Features: wt (weight), disp (displacement), mpg (miles/gallon).
- Model gives probabilities. Over 0.5 means yes.
- We tuned threshold to 0.7 for better accuracy (from 83% to 92%).
- ROC curve helps pick the best threshold.
