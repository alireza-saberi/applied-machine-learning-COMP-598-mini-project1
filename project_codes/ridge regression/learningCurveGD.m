function [train_err, test_err, train_var, test_var] = learningCurveGD(X_train_val, Y_train_val, X_test, Y_test, iterations,lambda_idx)
% make learning curves for gradient descent method
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

%divide the training set into 10 parts
[r, c] = size(X_train_val);
learning_intervals = 10;
learning_iters = floor(r/learning_intervals);

train_err = zeros(1,learning_intervals);
test_err   = zeros(1,learning_intervals);
train_var = zeros(1,learning_intervals);
test_var   = zeros(1,learning_intervals);
count = 1;
% accumulatively calculate the learning cost
for i = learning_iters:learning_iters:r
    [train_err(count) test_err(count) train_var(count) test_var(count)] = gradient_descent_test(X_train_val(1:i, :), Y_train_val(1:i, :), X_test, Y_test,iterations, lambda_idx);
    count = count + 1;
end

end