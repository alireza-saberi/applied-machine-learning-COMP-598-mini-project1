function [train_val_err test_err train_var test_var] = Ridge_closed_form_test(Xtrain_val, Ytrain_val, Xtest, Ytest, lambda_index)

lambda_rec = [0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];
lambda = lambda_rec(lambda_index);

theta = normalEqualtion(Xtrain_val,Ytrain_val,lambda);

h1 = MultipleVariableLR(theta, Xtrain_val);
train_val_err = sqrt(sum((h1' - Ytrain_val).^2)/length(Ytrain_val));
[trainR, trainC] = size(Xtrain_val);
% ../(n-m-1)
train_var = sum((h1' - Ytrain_val).^2) / (trainR - trainC - 1);

h2 = MultipleVariableLR(theta, Xtest);
test_err = sqrt(sum((h2' - Ytest).^2)/length(Ytest));
[testR, testC] = size(Xtest);
% ../(n-m-1)
test_var = sum((h2' - Ytest).^2) / (testR - testC - 1);
end