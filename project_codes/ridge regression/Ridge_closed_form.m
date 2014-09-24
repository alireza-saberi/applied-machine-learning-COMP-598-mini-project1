function costTable = Ridge_closed_form(X, y, foldNums)

Xall = X;
Yall = y;
k = foldNums;
%lambda_rec = [0 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];
lambda_rec = [0.00001 0.0001 0.001 0.01 0.1 1 10 100 1000 10000 100000];
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
        theta = normalEqualtion(Xtrain,Ytrain,lambda);
        h1 = MultipleVariableLR(theta, Xtrain);
        costTable(i, (kk-1)*2+1) = sqrt(sum((h1' - Ytrain).^2)/length(Ytrain));
        h2 = MultipleVariableLR(theta, Xval);
        costTable(i, (kk-1)*2+2) = sqrt(sum((h2' - Yval).^2)/length(Yval));
    end
end

end