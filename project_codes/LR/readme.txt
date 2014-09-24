There are two folders 
LR and ridge regression
LR contains linear regresion closed form and GradientDescent
ridge regression  contains closed-form ridge regression, and gradient-descent ridge regression

### For folder ridge regression
Step1:
use the featureprocess.m file to get the original data set
Step2:
run main_cf.m file for closed-form ridge regression or run main_gd.m file for gradient-descent ridge regression
Step3:
run main_cf_learningcurves.m file to get the learning curves of closed-form ridge regression or run main_gd_learningcurves.m file to get the learning curves of gradient-descent ridge regression

### For folder LR
step 1
run ClosedformLR_order1_MSE to ClosedformLR_order4_MSE to get calculate theta, plot 2-fold cross validation error, and calculate MSE to compare hypothesis

step 2:
run GradientDescentLR_order1_alpha_MSE_finder to GradientDescentLR_order4_alpha_MSE_finder to calculate proper alpha and proper iteration number
Plot cross validation for erors of 2-fold cross validation,Calculate MSE, on order 1-4  and compare their MSE at the end

step3:
run LearningCurve_CloseForm_LR_O4 to see learing curve of closed form of order 4
run LearningCurve_GradientDiscent_LR_O4 to see learing curve of gradient discent of order 4