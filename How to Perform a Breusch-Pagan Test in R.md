How to Perform a Breusch-Pagan Test in R  
  
Last Updated :   
23 Jul, 2025  
  
*   
*   
*   
The Breusch-Pagan test is a statistical test used to detect ++[heteroscedasticity](https://www.geeksforgeeks.org/machine-learning/heteroscedasticity-in-regression-analysis/)++ in a regression model. Heteroscedasticity occurs when the variance of the errors is not constant across all levels of the independent variables, which can lead to inefficient estimates and affect the reliability of hypothesis tests.  
Understanding the Breusch-Pagan Test  
The Breusch-Pagan test checks if the variance of errors in a regression model changes based on the predictors. It does this by squaring the errors and then checking if there's a relationship between these squared errors and the original predictors. If there's no relationship, it means the error variance is constant (no heteroscedasticity). If there is a relationship, it suggests heteroscedasticity is present.  
***Syntax:***  
  
*bptest(formula, data, studentize = TRUE)*  
  
***Here,***  
  
* ***formula: ****The formula specifies the linear model.*  
* ***data:**** The data frame containing the variables in the model.*  
* ***studentize: ****Logical; if TRUE, the test uses studentized residuals. The default is TRUE.*  
Implement Breusch-Pagan Test in R  
Now we will discuss how to Implement Breusch-Pagan Test in R Programming Language step by step.  
Step 1: Install and Load Required Packages  
Here are we first install and load the Required Packages.  
  
```
install.packages("lmtest")
install.packages("car")
library(lmtest)
library(car)

```
Step 2: Fit a Linear Regression Model  
Here we will fit a Linear Regression Model to Perform a Breusch-Pagan Test.  
  
```
data(mtcars)
model <- lm(mpg ~ hp + wt, data = mtcars)
summary(model)

```
**Output:**  
```
Call:
lm(formula = mpg ~ hp + wt, data = mtcars)

Residuals:
   Min     1Q Median     3Q    Max 
-3.941 -1.600 -0.182  1.050  5.854 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept) 37.22727    1.59879  23.285  < 2e-16 ***
hp          -0.03177    0.00903  -3.519  0.00145 ** 
wt          -3.87783    0.63273  -6.129 1.12e-06 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.593 on 29 degrees of freedom
Multiple R-squared:  0.8268,    Adjusted R-squared:  0.8148 
F-statistic: 69.21 on 2 and 29 DF,  p-value: 9.109e-12

```
Step 3: Perform the Breusch-Pagan Test  
Now we will Perform the Breusch-Pagan Test with the help of bptest function.  
  
```
bp_test <- bptest(model)
print(bp_test)

```
**Output:**  
```
        studentized Breusch-Pagan test

data:  model
BP = 0.88072, df = 2, p-value = 0.6438

```
Since the p-value (0.6438) is much greater than 0.05, we fail to reject the null hypothesis. This indicates that there is no significant evidence of heteroscedasticity in the residuals of the regression model. Therefore, we can conclude that the assumption of homoscedasticity holds for this model, meaning the variance of the error terms is constant across observations.  
Conclusion  
The Breusch-Pagan test is an essential tool for diagnosing heteroscedasticity in regression models. By following the outlined steps, it is easy to perform this test in R and take necessary actions if heteroscedasticity is detected. Addressing heteroscedasticity ensures the reliability of regression analysis, leading to more accurate and valid inferences.  
  
  
  
## Koenker–Bassett Test for Heteroskedasticity  
The **Koenker–Bassett test** is a robust extension of the **[Breusch–Pagan test](https://metricgate.com/docs/breusch-pagan-test/)** for heteroskedasticity in linear regression. By replacing raw squared residuals with **[studentized residuals](https://metricgate.com/docs/studentized-residuals/)**, it removes the assumption of normally distributed errors, making it more reliable in applied regression analysis where normality cannot be guaranteed.  
  
## Overview  
Heteroskedasticity — non-constant variance of regression residuals — is one of the most common violations of the classical linear regression assumptions. When present, ordinary least squares (OLS) coefficient estimates remain unbiased but are no longer efficient, and standard errors, t-tests, and confidence intervals are all invalid. Detecting heteroskedasticity before drawing inferential conclusions is therefore a critical step in **[regression diagnostics](https://metricgate.com/docs/regression-diagnostics/)**.  
The original **[Breusch–Pagan test](https://metricgate.com/docs/bartletts-test-for-homogeneity/)** (1979) regresses squared residuals on the predictors but assumes normally distributed errors for its chi-squared approximation to be accurate. Koenker and Bassett (1982) showed that this normality assumption can be dropped by instead using **studentized residuals** — residuals divided by the estimated **[standard deviation](https://metricgate.com/docs/standard-deviation-calculator/)**. The resulting test is asymptotically valid under any error distribution with finite fourth moments, making it the preferred version in most applied work. In R, the ****bptest()**** function from the ****lmtest**** package implements the Koenker–Bassett version when the argument ****studentize = TRUE**** (the default).  
  
