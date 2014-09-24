function [train_val_err test_err] = Ridge_gradient_descent_test(Xtrain_val, Ytrain_val, Xtest, Ytest,num_iters, lambda_index)

%lambda_rec = [0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];
%lambda_rec = [0.0001 0.001 0.01 0.1 1 10 100 1000 10000 30000 100000 300000 1000000 3000000];
lambda_rec = [0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];
lambda = lambda_rec(lambda_index);

theta = GradientDescent(Xtrain_val, Ytrain_val, num_iters, lambda);

h1 = MultipleVariableLR(theta, Xtrain_val);
train_val_err = sqrt(sum((h1' - Ytrain_val).^2)/length(Ytrain_val));

h2 = MultipleVariableLR(theta, Xtest);
test_err = sqrt(sum((h2' - Ytest).^2)/length(Ytest));

end