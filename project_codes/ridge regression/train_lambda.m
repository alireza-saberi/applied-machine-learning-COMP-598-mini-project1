function [costTable] = train_lambda(X, y, foldNums, iterations)
% use n-fold cross-validation to get cost value for each lambda value
% It's written as a part of ML course at McGill University, Fall 2014 
% Professor: Joelle Pineau
% Codes: Alireza Saberi , Liu Yuguang, Jenna Wong

Xall = X;
Yall = y;
k = foldNums;  % k-fold
lambda_rec = [0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000]; %lambda pools
Nrows = length(lambda_rec);
Ncols = k*2;
c = size(Xall,2);
costTable = zeros(Nrows, Ncols);

%create train and validation
for kk = 1:k
    %input k--k folders, kk - the kkth segmentation method
    [Xtrain, Ytrain, Xval, Yval] = create_nth_kfold_crossvalidation(Xall, Yall, k, kk);
    for i = 1: length(lambda_rec)
        lambda = lambda_rec(i);
        % call gradient descent function to get the theta value
        theta = GradientDescent(Xtrain, Ytrain, iterations, lambda);
        %use theta to predicting the output for training set
        h1 = MultipleVariableLR(theta, Xtrain);
        % calculate RMSE for training set
        costTable(i, (kk-1)*2+1) = sqrt(sum((h1' - Ytrain).^2)/length(Ytrain));
        %use theta to predicting the output for validation set
        h2 = MultipleVariableLR(theta, Xval);
        % calculate RMSE for validation set
        costTable(i, (kk-1)*2+2) = sqrt(sum((h2' - Yval).^2)/length(Yval));
    end

end
