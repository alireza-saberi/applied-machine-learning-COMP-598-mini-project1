function [train_val_err test_err train_var test_var] = gradient_descent_test(Xtrain_val, Ytrain_val, Xtest, Ytest, iterations, lambda_index)
% get gradient descent method's training and testing error
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

    lambda_rec = [0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];

    %create train and validation
    lambda = lambda_rec(lambda_index);
    theta = GradientDescent(Xtrain_val, Ytrain_val, iterations, lambda);
    h1 = MultipleVariableLR(theta, Xtrain_val);
    %training set's error
    train_val_err = sqrt(sum((h1' - Ytrain_val).^2)/length(Ytrain_val));
    
    [trainR, trainC] = size(Xtrain_val);
    % traning set's variance:  ../(n-m-1)
    train_var = sum((h1' - Ytrain_val).^2) / (trainR - trainC - 1);

    h2 = MultipleVariableLR(theta, Xtest);
    %testing set's error
    test_err = sqrt(sum((h2' - Ytest).^2)/length(Ytest));
    [testR, testC] = size(Xtest);
    % traning set's variance:  ../(n-m-1)
    test_var = sum((h2' - Ytest).^2) / (testR - testC - 1);

end
